#!/usr/bin/env bash
# audit-third-party-js.sh — flags any external runtime JS on a built site.
#
# The engine's baseline is zero third-party JS at runtime (analytics excluded
# only if self-hosted Plausible/Umami; GA4 counts as third-party). Any
# external script URL, iframe from a non-owned origin, or CDN-hosted JS
# module surfaces here and fails CI.
#
# Usage:
#   bash .claude/skills/scripts/audit-third-party-js.sh <dist-dir> <allowed-origins-file>
#
# allowed-origins-file: one origin per line, e.g.
#   https://plausible.example.com
#   https://www.google-analytics.com
#   (a host can whitelist its analytics provider; the audit log records the decision)
#
# Exit codes:
#   0 — no unauthorised third-party JS
#   1 — at least one unauthorised third-party reference found
#   3 — prerequisite missing

set -euo pipefail

DIST_DIR="${1:-dist}"
ALLOWED_FILE="${2:-.third-party-allowed}"
REPORT="${REPORT:-reports/third-party-audit.txt}"

[ -d "$DIST_DIR" ] || { echo "audit-third-party-js: $DIST_DIR not found" >&2; exit 3; }
mkdir -p "$(dirname "$REPORT")"

# Build grep pattern from allowed origins; empty file means block everything.
ALLOW_PATTERN=""
if [ -f "$ALLOWED_FILE" ]; then
    ALLOW_PATTERN=$(grep -vE '^(#|$)' "$ALLOWED_FILE" | tr '\n' '|' | sed 's/|$//')
fi

FOUND=$(grep -RhoE '(src|href)="https?://[^"]+"' "$DIST_DIR" 2>/dev/null | \
    grep -oE 'https?://[^"]+' | sort -u || true)

FAIL=0
{
    echo "Third-party asset audit — $(date -u +%Y-%m-%dT%H:%M:%SZ)"
    echo "Scanned: $DIST_DIR"
    echo "Allowlist: ${ALLOWED_FILE:-none}"
    echo "---"
    while IFS= read -r url; do
        [ -z "$url" ] && continue
        # Same-origin references are fine
        case "$url" in
            http://localhost*|https://localhost*) continue;;
        esac
        if [ -n "$ALLOW_PATTERN" ] && echo "$url" | grep -qE "^($ALLOW_PATTERN)"; then
            echo "ALLOW $url"
        else
            echo "BLOCK $url"
            FAIL=1
        fi
    done <<< "$FOUND"
} | tee "$REPORT"

if [ "$FAIL" -ne 0 ]; then
    echo "audit-third-party-js: FAIL — unauthorised third-party asset(s) found. See $REPORT" >&2
    exit 1
fi
echo "audit-third-party-js: PASS"
