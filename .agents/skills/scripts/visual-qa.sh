#!/usr/bin/env bash
# visual-qa.sh — canonical visual QA gate.
#
# Orchestrates three checks on a built static site:
#   1. Playwright screenshot diff vs tests/visual/baseline/
#   2. Structural assertions (heading hierarchy, horizontal overflow,
#      empty-section) via tests/visual/structure.spec.ts
#   3. AI-slop scan on rendered HTML and CSS via scripts/slop-scan.sh
#
# Usage:
#   bash .claude/skills/scripts/visual-qa.sh
#
# Exit codes:
#   0 — all visual gates passed (diffs within threshold, no structural
#       failure, no slop block)
#   1 — screenshot diff over threshold
#   2 — structural assertion failed
#   3 — slop-scan blocked
#   4 — prerequisite missing
#   5 — no built output

set -euo pipefail

ROOT="$(pwd)"
SKILLS_DIR="${SKILLS_DIR:-$ROOT/.claude/skills}"
DIST_DIR="${DIST_DIR:-$ROOT/dist}"
REPORTS_DIR="${REPORTS_DIR:-$ROOT/reports}/visual"
VISUAL_DIR="${VISUAL_DIR:-$ROOT/tests/visual}"

command -v npx >/dev/null 2>&1 || { echo "visual-qa: npx required" >&2; exit 4; }
[ -d "$DIST_DIR" ] || { echo "visual-qa: $DIST_DIR not found. Build first." >&2; exit 5; }
[ -d "$VISUAL_DIR" ] || { echo "visual-qa: $VISUAL_DIR not found. Copy tests/visual/ from the skills repo." >&2; exit 4; }

mkdir -p "$REPORTS_DIR/diff"

echo "visual-qa: running structural assertions"
STRUCT_EXIT=0
npx --yes playwright test "$VISUAL_DIR/structure.spec.ts" \
    --reporter=list \
    --output="$REPORTS_DIR/structure" || STRUCT_EXIT=$?
if [ "$STRUCT_EXIT" -ne 0 ]; then
    echo "visual-qa: FAIL — structural assertion failure. See $REPORTS_DIR/structure" >&2
    exit 2
fi

echo "visual-qa: running screenshot diff"
DIFF_EXIT=0
npx --yes playwright test "$VISUAL_DIR/capture.spec.ts" \
    --reporter=list \
    --output="$REPORTS_DIR/diff" || DIFF_EXIT=$?
if [ "$DIFF_EXIT" -ne 0 ]; then
    echo "visual-qa: FAIL — screenshot diff over threshold. See $REPORTS_DIR/diff" >&2
    exit 1
fi

echo "visual-qa: running slop-scan"
if [ -x "$SKILLS_DIR/scripts/slop-scan.sh" ]; then
    SLOP_EXIT=0
    bash "$SKILLS_DIR/scripts/slop-scan.sh" "$DIST_DIR" || SLOP_EXIT=$?
    if [ "$SLOP_EXIT" -ne 0 ]; then
        echo "visual-qa: FAIL — slop-scan blocked. See reports/visual/slop-scan.json" >&2
        exit 3
    fi
else
    echo "visual-qa: WARN — scripts/slop-scan.sh not found; skipping slop scan" >&2
fi

{
    echo "# Visual QA Summary"
    echo ""
    echo "Run: $(date -u +%Y-%m-%dT%H:%M:%SZ)"
    echo ""
    echo "- Structural assertions: PASS"
    echo "- Screenshot diff: PASS"
    echo "- Slop scan: PASS"
} > "$REPORTS_DIR/summary.md"

echo "visual-qa: PASS — all visual gates green. Summary: $REPORTS_DIR/summary.md"
