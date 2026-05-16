#!/usr/bin/env bash
# a11y-gate.sh — canonical accessibility gate.
#
# Runs axe-core against every primary route on a built static preview.
# Fails on any "serious" or "critical" violation. Writes full results to
# reports/a11y/. Intended to be called from the canonical CI pipeline and
# from any operator's local machine.
#
# Usage from a client project:
#   bash .claude/skills/scripts/a11y-gate.sh
#
# Exit codes:
#   0 — no serious or critical violations
#   1 — serious or critical violations found
#   3 — prerequisite missing
#   4 — no built output to serve

set -euo pipefail

ROOT="$(pwd)"
SKILLS_DIR="${SKILLS_DIR:-$ROOT/.claude/skills}"
DIST_DIR="${DIST_DIR:-$ROOT/dist}"
REPORTS_DIR="${REPORTS_DIR:-$ROOT/reports}/a11y"
PORT="${A11Y_PORT:-4321}"
ROUTES_FILE="${ROUTES_FILE:-$SKILLS_DIR/performance-budgets.json}"

command -v npx >/dev/null 2>&1 || { echo "a11y-gate: npx not found" >&2; exit 3; }
command -v jq >/dev/null 2>&1 || { echo "a11y-gate: jq not found" >&2; exit 3; }

[ -d "$DIST_DIR" ] || { echo "a11y-gate: $DIST_DIR not found. Build first." >&2; exit 4; }
[ -f "$ROUTES_FILE" ] || { echo "a11y-gate: $ROUTES_FILE not found" >&2; exit 3; }

mkdir -p "$REPORTS_DIR"

# Preview
echo "a11y-gate: starting preview on :$PORT"
npx --yes serve "$DIST_DIR" -l "$PORT" >"$REPORTS_DIR/preview.log" 2>&1 &
SERVER_PID=$!
trap 'kill $SERVER_PID 2>/dev/null || true' EXIT

for _ in $(seq 1 30); do
    if curl -sSf "http://localhost:$PORT/" >/dev/null 2>&1; then break; fi
    sleep 0.5
done

# Build URL list from performance-budgets.json (shared source of truth);
# skip parametrised routes like /services/[slug]/.
URLS=()
while IFS= read -r route; do
    case "$route" in *'['*) continue;; esac
    URLS+=("http://localhost:$PORT$route")
done < <(jq -r '.routes | keys[]' "$ROUTES_FILE")

echo "a11y-gate: running axe on ${#URLS[@]} route(s)"

TAGS="wcag2a,wcag2aa,wcag21a,wcag21aa,wcag22aa,best-practice"

FAIL=0
SUMMARY="$REPORTS_DIR/summary.md"
: > "$SUMMARY"
{
    echo "# Accessibility Gate Summary"
    echo ""
    echo "Run: $(date -u +%Y-%m-%dT%H:%M:%SZ)"
    echo "Routes: ${#URLS[@]}"
    echo ""
    echo "| Route | Critical | Serious | Moderate | Minor |"
    echo "|---|---|---|---|---|"
} >> "$SUMMARY"

for url in "${URLS[@]}"; do
    slug=$(echo "$url" | sed 's#http://localhost:[0-9]*#root#; s#[/?&]#_#g; s#_$##')
    json="$REPORTS_DIR/${slug}.json"
    # axe --exit returns non-zero on any violation (regardless of severity);
    # we run without --exit and classify ourselves.
    npx --yes @axe-core/cli "$url" \
        --tags "$TAGS" \
        --save "$json" \
        --stdout >/dev/null 2>&1 || true

    if [ ! -f "$json" ]; then
        echo "a11y-gate: axe failed to emit result for $url" >&2
        FAIL=1
        continue
    fi

    crit=$(jq '[.[].violations[]?|select(.impact=="critical")]|length' "$json")
    ser=$(jq '[.[].violations[]?|select(.impact=="serious")]|length' "$json")
    mod=$(jq '[.[].violations[]?|select(.impact=="moderate")]|length' "$json")
    minor=$(jq '[.[].violations[]?|select(.impact=="minor")]|length' "$json")

    echo "| $url | $crit | $ser | $mod | $minor |" >> "$SUMMARY"
    if [ "$crit" -gt 0 ] || [ "$ser" -gt 0 ]; then
        FAIL=1
    fi
done

if [ "$FAIL" -ne 0 ]; then
    echo "a11y-gate: FAIL — serious/critical violations present. See $SUMMARY" >&2
    exit 1
fi
echo "a11y-gate: PASS — no serious or critical violations. Summary: $SUMMARY"
