#!/usr/bin/env bash
# check-security-headers.sh — validates HTTP security headers against the
# baseline in security-gate/references/csp-baseline.md.
#
# Runs against the same preview the perf and a11y gates use. For edge-
# configured headers (Nginx, Cloudflare), the gate is also run against the
# staging URL in CI.
#
# Usage:
#   bash .claude/skills/scripts/check-security-headers.sh <dist-dir> [target-url]
#
# If <target-url> is given, headers are fetched from that URL (live staging
# or production). Otherwise a temporary preview is spun up and headers are
# checked against that. Note: framework-served headers are visible only on
# dev/preview or when the framework runs in SSR mode; pure static sites rely
# on edge and must validate against staging.
#
# Exit codes:
#   0 — all required headers present and valid
#   1 — missing or invalid header
#   3 — prerequisite missing

set -euo pipefail

DIST_DIR="${1:-dist}"
TARGET="${2:-}"
REPORT="reports/security/headers.txt"
mkdir -p "$(dirname "$REPORT")"

[ -d "$DIST_DIR" ] || { echo "check-security-headers: $DIST_DIR not found" >&2; exit 3; }

SERVER_PID=""
if [ -z "$TARGET" ]; then
    PORT="${HEADER_PORT:-4322}"
    npx --yes serve "$DIST_DIR" -l "$PORT" >/dev/null 2>&1 &
    SERVER_PID=$!
    trap 'kill $SERVER_PID 2>/dev/null || true' EXIT
    for _ in $(seq 1 30); do
        curl -sSf "http://localhost:$PORT/" >/dev/null 2>&1 && break
        sleep 0.3
    done
    TARGET="http://localhost:$PORT"
    echo "check-security-headers: WARNING — validating against local preview. Edge-configured headers (Nginx, Cloudflare) must be validated against staging separately." | tee "$REPORT" >&2
fi

FAIL=0
log() { echo "$1" | tee -a "$REPORT"; }

check_header() {
    local header="$1"
    local expected="$2"
    local value
    value=$(curl -sSI "$TARGET/" | awk -F': ' -v h="$header" 'BEGIN{IGNORECASE=1} tolower($1)==tolower(h){sub(/\r$/,"",$2);print $2}')
    if [ -z "$value" ]; then
        log "FAIL missing header: $header"
        FAIL=1
        return
    fi
    if [ -n "$expected" ] && ! echo "$value" | grep -qi "$expected"; then
        log "FAIL header $header='$value' does not match expected '$expected'"
        FAIL=1
    else
        log "PASS $header"
    fi
}

log "# Security header audit — $(date -u +%Y-%m-%dT%H:%M:%SZ)"
log "Target: $TARGET"

check_header "Strict-Transport-Security" "max-age"
check_header "X-Frame-Options" "DENY\|SAMEORIGIN"
check_header "X-Content-Type-Options" "nosniff"
check_header "Referrer-Policy" "strict-origin\|same-origin\|no-referrer"
check_header "Permissions-Policy" ""
check_header "Content-Security-Policy" "default-src"
check_header "Cross-Origin-Opener-Policy" "same-origin"
check_header "Cross-Origin-Resource-Policy" "same-origin\|same-site"

if [ "$FAIL" -ne 0 ]; then
    echo "check-security-headers: FAIL — see $REPORT" >&2
    exit 1
fi
echo "check-security-headers: PASS"
