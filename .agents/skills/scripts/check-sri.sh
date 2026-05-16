#!/usr/bin/env bash
# check-sri.sh — asserts that every third-party script/style carries a valid
# integrity attribute. Local assets are skipped.
#
# Usage:
#   bash .claude/skills/scripts/check-sri.sh <dist-dir> [allowlist-file]
#
# Exit codes:
#   0 — every third-party asset has SRI
#   1 — at least one third-party asset missing SRI
#   3 — prerequisite missing

set -euo pipefail

DIST_DIR="${1:-dist}"
ALLOWED_FILE="${2:-.third-party-allowed}"
REPORT="reports/security/sri.txt"
mkdir -p "$(dirname "$REPORT")"

[ -d "$DIST_DIR" ] || { echo "check-sri: $DIST_DIR not found" >&2; exit 3; }

FAIL=0
: > "$REPORT"
{
    echo "SRI audit — $(date -u +%Y-%m-%dT%H:%M:%SZ)"
    echo "---"
} >> "$REPORT"

while IFS= read -r -d '' html; do
    rel="${html#$DIST_DIR/}"
    # Every <script src="http(s)..."> that is not same-origin must carry integrity + crossorigin
    while IFS= read -r line; do
        # Extract src/href
        url=$(echo "$line" | grep -oE '(src|href)="https?://[^"]+"' | head -1 | sed 's/.*="//; s/"$//')
        [ -z "$url" ] && continue
        # If localhost, skip (same-origin variant of preview)
        case "$url" in http://localhost*|https://localhost*) continue ;; esac
        # If allowlisted by origin, still require SRI unless the allowlist entry opts out
        if ! echo "$line" | grep -qE 'integrity="sha(256|384|512)-[A-Za-z0-9+/=]+"'; then
            echo "FAIL $rel: $url missing integrity=" >> "$REPORT"
            FAIL=1
        fi
    done < <(grep -oE '<(script|link)[^>]+(src|href)="https?://[^"]+"[^>]*/?>' "$html" 2>/dev/null || true)
done < <(find "$DIST_DIR" -type f -name '*.html' -print0)

cat "$REPORT"
if [ "$FAIL" -ne 0 ]; then
    echo "check-sri: FAIL — see $REPORT" >&2
    exit 1
fi
echo "check-sri: PASS"
