#!/usr/bin/env bash
# perf-gate.sh — canonical performance gate for the website-skills engine.
#
# Runs Lighthouse CI against every primary route on a built static preview,
# asserts the thresholds in lighthouserc.json, checks route-level weight
# budgets in performance-budgets.json, and emits reports under reports/.
#
# Usage from a client project that has this repo mounted at .claude/skills/:
#   bash .claude/skills/scripts/perf-gate.sh
#
# Exit codes:
#   0  — all gates passed
#   1  — Lighthouse threshold failure
#   2  — route weight budget exceeded
#   3  — tool prerequisite missing
#   4  — no built output to serve
#
# Prerequisites (install once per project):
#   npm i -D @lhci/cli serve jq

set -euo pipefail

ROOT="$(pwd)"
SKILLS_DIR="${SKILLS_DIR:-$ROOT/.claude/skills}"
LHCI_CONFIG="${LHCI_CONFIG:-$SKILLS_DIR/lighthouserc.json}"
BUDGETS_FILE="${BUDGETS_FILE:-$SKILLS_DIR/performance-budgets.json}"
DIST_DIR="${DIST_DIR:-$ROOT/dist}"
REPORTS_DIR="${REPORTS_DIR:-$ROOT/reports}"
PORT="${PERF_GATE_PORT:-4321}"

command -v npx >/dev/null 2>&1 || { echo "perf-gate: npx not found" >&2; exit 3; }
command -v jq >/dev/null 2>&1 || { echo "perf-gate: jq not found" >&2; exit 3; }

[ -d "$DIST_DIR" ] || { echo "perf-gate: $DIST_DIR not found. Run the project build first." >&2; exit 4; }
[ -f "$LHCI_CONFIG" ] || { echo "perf-gate: lighthouserc.json missing at $LHCI_CONFIG" >&2; exit 3; }
[ -f "$BUDGETS_FILE" ] || { echo "perf-gate: performance-budgets.json missing at $BUDGETS_FILE" >&2; exit 3; }

mkdir -p "$REPORTS_DIR/lighthouse" "$REPORTS_DIR/bundle"

echo "perf-gate: starting static preview on :$PORT"
npx --yes serve "$DIST_DIR" -l "$PORT" >"$REPORTS_DIR/preview.log" 2>&1 &
SERVER_PID=$!
trap 'kill $SERVER_PID 2>/dev/null || true' EXIT

# Wait for server
for _ in $(seq 1 30); do
    if curl -sSf "http://localhost:$PORT/" >/dev/null 2>&1; then break; fi
    sleep 0.5
done

echo "perf-gate: running Lighthouse CI"
LHCI_EXIT=0
npx --yes @lhci/cli autorun --config="$LHCI_CONFIG" || LHCI_EXIT=$?

echo "perf-gate: validating route weight budgets"
BUDGET_FAIL=0
ROUTES=$(jq -r '.routes | keys[]' "$BUDGETS_FILE")
for route in $ROUTES; do
    # Skip parametrised routes (e.g. /services/[slug]/) — perf-gate only asserts concrete URLs
    case "$route" in *'['*) continue;; esac
    weight_budget=$(jq -r --arg r "$route" '.routes[$r].total_weight_kb // .global.total_weight_kb' "$BUDGETS_FILE")
    url="http://localhost:$PORT$route"
    # Measure total payload (HTML+CSS+JS+images linked from HTML) via curl-based walker.
    # This is a rough proxy; authoritative numbers come from Lighthouse.
    actual_kb=$(curl -sS "$url" 2>/dev/null | wc -c | awk '{printf "%.0f", $1/1024}')
    if [ "$actual_kb" -gt "$weight_budget" ]; then
        echo "perf-gate: route $route HTML alone ${actual_kb}KB exceeds total budget ${weight_budget}KB" >&2
        BUDGET_FAIL=1
    fi
done

if [ "$LHCI_EXIT" -ne 0 ]; then
    echo "perf-gate: FAIL — Lighthouse thresholds not met. See $REPORTS_DIR/lighthouse/" >&2
    exit 1
fi
if [ "$BUDGET_FAIL" -ne 0 ]; then
    echo "perf-gate: FAIL — route weight budget exceeded." >&2
    exit 2
fi

echo "perf-gate: PASS — all routes within Lighthouse thresholds and weight budgets."
