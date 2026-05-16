#!/usr/bin/env bash
# scan-secrets.sh — scan the repository for leaked credentials.
#
# Runs a curated ruleset over the working tree (default) or staged changes
# (--staged, for pre-commit use). Refuses to fail silently: every hit is
# surfaced.
#
# Usage:
#   bash .claude/skills/scripts/scan-secrets.sh [--staged]
#
# Exit codes:
#   0 — no secrets detected
#   1 — at least one secret detected
#   3 — prerequisite missing

set -euo pipefail

MODE="tree"
if [ "${1:-}" = "--staged" ]; then
    MODE="staged"
fi

REPORT="reports/security/secrets.txt"
mkdir -p "$(dirname "$REPORT")"
: > "$REPORT"

# Rules: label → regex
declare -A RULES=(
    ["aws-access-key"]='AKIA[0-9A-Z]{16}'
    ["aws-secret-key"]='(aws_secret_access_key|AWS_SECRET_ACCESS_KEY)[=:\"\\s]+[A-Za-z0-9/+=]{40}'
    ["stripe-live-key"]='sk_live_[0-9A-Za-z]{24,}'
    ["stripe-restricted"]='rk_live_[0-9A-Za-z]{24,}'
    ["stripe-publishable"]='pk_live_[0-9A-Za-z]{24,}'
    ["github-token"]='gh[pousr]_[A-Za-z0-9]{36,}'
    ["gcp-service-account"]='"type":[[:space:]]*"service_account"'
    ["rsa-private-key"]='-----BEGIN RSA PRIVATE KEY-----'
    ["openssh-private-key"]='-----BEGIN OPENSSH PRIVATE KEY-----'
    ["ec-private-key"]='-----BEGIN EC PRIVATE KEY-----'
    ["pgp-private-key"]='-----BEGIN PGP PRIVATE KEY BLOCK-----'
    ["sendgrid-key"]='SG\.[A-Za-z0-9_-]{22}\.[A-Za-z0-9_-]{43}'
    ["mailgun-key"]='key-[0-9a-zA-Z]{32}'
    ["twilio-key"]='SK[0-9a-fA-F]{32}'
    ["slack-token"]='xox[baprs]-[0-9a-zA-Z-]{10,}'
    ["generic-api-key"]='(api[_-]?key|secret|password|passwd|token)["'\'' :=]{1,5}[A-Za-z0-9+_=/-]{32,}'
)

if [ "$MODE" = "staged" ]; then
    FILES=$(git diff --cached --name-only --diff-filter=AM)
else
    FILES=$(git ls-files)
fi

FAIL=0
while IFS= read -r file; do
    [ -z "$file" ] && continue
    [ -d "$file" ] && continue
    # Skip binary files and the suppressions file itself
    case "$file" in
        *.png|*.jpg|*.jpeg|*.webp|*.avif|*.gif|*.mp4|*.mov|*.pdf) continue ;;
        .audit-suppress.json) continue ;;
        reports/security/*) continue ;;
    esac
    [ -f "$file" ] || continue
    for label in "${!RULES[@]}"; do
        regex="${RULES[$label]}"
        if grep -HnE -- "$regex" "$file" 2>/dev/null | grep -v '# scan-secrets:ignore' >> "$REPORT"; then
            echo "FAIL [$label] in $file" | tee -a "$REPORT" >&2
            FAIL=1
        fi
    done
done <<< "$FILES"

if [ "$FAIL" -ne 0 ]; then
    echo "scan-secrets: FAIL — see $REPORT" >&2
    echo "Next: rotate the exposed credential. See security-gate/references/secrets-response.md" >&2
    exit 1
fi
echo "scan-secrets: PASS"
