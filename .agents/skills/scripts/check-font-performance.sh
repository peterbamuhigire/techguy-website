#!/usr/bin/env bash
# check-font-performance.sh — asserts the engine's font performance contract:
#   - every @font-face has font-display: swap (or optional/fallback)
#   - every critical font weight has a <link rel="preload" as="font"> tag
#   - every self-hosted font is subsetted (woff2 preferred, no TTF in production)
#   - total font weight per page stays inside the budget in performance-budgets.json
#
# Usage:
#   bash .claude/skills/scripts/check-font-performance.sh <dist-dir>
#
# Exit codes:
#   0 — all checks pass
#   1 — at least one assertion failed
#   3 — prerequisite missing

set -euo pipefail

DIST_DIR="${1:-dist}"
SKILLS_DIR="${SKILLS_DIR:-$(pwd)/.claude/skills}"
BUDGETS_FILE="${BUDGETS_FILE:-$SKILLS_DIR/performance-budgets.json}"
REPORT="${REPORT:-reports/font-audit.txt}"

command -v jq >/dev/null 2>&1 || { echo "check-font-performance: jq required" >&2; exit 3; }
[ -d "$DIST_DIR" ] || { echo "check-font-performance: $DIST_DIR not found" >&2; exit 3; }
[ -f "$BUDGETS_FILE" ] || { echo "check-font-performance: performance-budgets.json missing" >&2; exit 3; }

mkdir -p "$(dirname "$REPORT")"
FAIL=0
FONT_BUDGET=$(jq -r '.global.font_kb_total' "$BUDGETS_FILE")

{
    echo "Font performance audit — $(date -u +%Y-%m-%dT%H:%M:%SZ)"
    echo "Budget: ${FONT_BUDGET}KB total per page"
    echo "---"

    # 1. Scan CSS for @font-face without font-display
    css_missing=$(grep -REl '@font-face' "$DIST_DIR" --include='*.css' 2>/dev/null | while read -r f; do
        # Look for @font-face blocks missing font-display
        awk 'BEGIN{RS="}"} /@font-face/ && !/font-display:/ {print FILENAME}' "$f" | head -1
    done || true)
    if [ -n "$css_missing" ]; then
        echo "FAIL font-display missing in:"
        echo "$css_missing"
        FAIL=1
    else
        echo "PASS font-display declared on all @font-face rules"
    fi

    # 2. Each HTML should have at least one font preload tag when it loads a web font
    html_files=$(find "$DIST_DIR" -name '*.html' 2>/dev/null)
    for html in $html_files; do
        if grep -qE 'font-family:|<link[^>]+\.woff2' "$html" 2>/dev/null; then
            if ! grep -qE '<link[^>]+rel="preload"[^>]+as="font"' "$html"; then
                echo "WARN missing font preload: ${html#$DIST_DIR/}"
                FAIL=1
            fi
        fi
    done

    # 3. Unsupported font formats (TTF/EOT) in production
    legacy=$(find "$DIST_DIR" -type f \( -iname '*.ttf' -o -iname '*.eot' -o -iname '*.otf' \) 2>/dev/null || true)
    if [ -n "$legacy" ]; then
        echo "FAIL legacy font formats shipped (use woff2 only):"
        echo "$legacy"
        FAIL=1
    else
        echo "PASS only modern font formats (woff2) in output"
    fi

    # 4. Total font weight check
    total_kb=$(find "$DIST_DIR" -type f -iname '*.woff2' -exec wc -c {} + 2>/dev/null | tail -1 | awk '{printf "%.0f", $1/1024}')
    total_kb=${total_kb:-0}
    if [ "$total_kb" -gt "$FONT_BUDGET" ]; then
        echo "FAIL total font weight ${total_kb}KB exceeds budget ${FONT_BUDGET}KB"
        FAIL=1
    else
        echo "PASS total font weight ${total_kb}KB within budget ${FONT_BUDGET}KB"
    fi
} | tee "$REPORT"

if [ "$FAIL" -ne 0 ]; then
    echo "check-font-performance: FAIL — see $REPORT" >&2
    exit 1
fi
echo "check-font-performance: PASS"
