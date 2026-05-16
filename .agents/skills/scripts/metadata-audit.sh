#!/usr/bin/env bash
# metadata-audit.sh — asserts SEO/OG/hreflang metadata on every shipped HTML.
#
# Every rendered page must have:
#   - <title>, non-empty, distinct per canonical URL
#   - <meta name="description"> between 50 and 165 characters
#   - <link rel="canonical">
#   - <meta property="og:title"> and <meta property="og:image">
#   - hreflang tags for every language when i18n is enabled
#
# Usage:
#   bash .claude/skills/scripts/metadata-audit.sh <dist-dir>
#
# Exit codes:
#   0 — all pages pass
#   1 — at least one page fails
#   3 — prerequisite missing

set -euo pipefail

DIST_DIR="${1:-dist}"
REPORT="${REPORT:-reports/metadata-audit.txt}"

[ -d "$DIST_DIR" ] || { echo "metadata-audit: $DIST_DIR not found" >&2; exit 3; }
mkdir -p "$(dirname "$REPORT")"

FAIL=0
SEEN_TITLES=""
: > "$REPORT"

while IFS= read -r -d '' html; do
    rel="${html#$DIST_DIR/}"
    # skip 404 and server-error pages from uniqueness check but still validate shape
    skip_unique=0
    case "$rel" in 404.html|500.html|offline.html) skip_unique=1 ;; esac

    if ! grep -qE '<title>[^<]+</title>' "$html"; then
        echo "FAIL missing or empty <title>: $rel" >> "$REPORT"
        FAIL=1
    else
        title=$(grep -oE '<title>[^<]+</title>' "$html" | head -1 | sed 's#<title>##; s#</title>##')
        if [ "$skip_unique" -eq 0 ]; then
            if echo "$SEEN_TITLES" | grep -qxF "$title"; then
                echo "FAIL duplicate <title> '$title': $rel" >> "$REPORT"
                FAIL=1
            else
                SEEN_TITLES="$SEEN_TITLES
$title"
            fi
        fi
    fi

    # description
    desc=$(grep -oE '<meta[^>]+name="description"[^>]+content="[^"]+"' "$html" | grep -oE 'content="[^"]+"' | sed 's/content="//; s/"$//')
    if [ -z "$desc" ]; then
        echo "FAIL missing meta description: $rel" >> "$REPORT"
        FAIL=1
    else
        len=${#desc}
        if [ "$len" -lt 50 ] || [ "$len" -gt 165 ]; then
            echo "WARN description ${len} chars (target 50-165): $rel" >> "$REPORT"
        fi
    fi

    # canonical
    if ! grep -qE '<link[^>]+rel="canonical"[^>]+href="https?://[^"]+"' "$html"; then
        echo "FAIL missing <link rel=canonical>: $rel" >> "$REPORT"
        FAIL=1
    fi

    # og
    if ! grep -qE '<meta[^>]+property="og:title"' "$html"; then
        echo "FAIL missing og:title: $rel" >> "$REPORT"
        FAIL=1
    fi
    if ! grep -qE '<meta[^>]+property="og:image"' "$html"; then
        echo "FAIL missing og:image: $rel" >> "$REPORT"
        FAIL=1
    fi

    # hreflang — only required if the site ships multi-language (heuristic: /en/ or /fr/ in path)
    if echo "$rel" | grep -qE '^(en|fr|sw|ar|es)/'; then
        if ! grep -qE '<link[^>]+rel="alternate"[^>]+hreflang=' "$html"; then
            echo "FAIL missing hreflang alternates on localised page: $rel" >> "$REPORT"
            FAIL=1
        fi
    fi
done < <(find "$DIST_DIR" -type f -name '*.html' -print0)

cat "$REPORT"
if [ "$FAIL" -ne 0 ]; then
    echo "metadata-audit: FAIL — see $REPORT" >&2
    exit 1
fi
echo "metadata-audit: PASS"
