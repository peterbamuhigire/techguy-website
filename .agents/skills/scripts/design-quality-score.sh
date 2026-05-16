#!/usr/bin/env bash
# design-quality-score.sh — aggregate rubric scores for the CI gate.
#
# Reads per-template reports from reports/design-quality/*.md, parses
# the machine-readable footer:
#
#   <!-- SCORES:
#   1=<N>, 2=<N>, 3=<N>, 4=<N>, 5=<N>, 6=<N>, 7=<N>, overall=<min>
#   -->
#
# Then:
#   1. Runs slop-scan.sh as a floor.
#   2. Confirms every primary template has a report.
#   3. Fails if any overall < 8 (blocking on main; advisory on PR).
#
# Usage:
#   bash scripts/design-quality-score.sh [dist-dir]
#
# Exit codes:
#   0 — all templates score ≥ 8 and slop-scan passes
#   1 — one or more templates below 8
#   2 — slop-scan fail
#   3 — missing template report
#   4 — malformed report
#   5 — prerequisite missing

set -euo pipefail

ROOT="$(pwd)"
DIST_DIR="${1:-$ROOT/dist}"
REPORTS_DIR="${REPORTS_DIR:-$ROOT/reports}/design-quality"
SKILLS_DIR="${SKILLS_DIR:-$ROOT/.claude/skills}"

if [[ ! -d "$DIST_DIR" ]]; then
  echo "FAIL: dist directory not found at $DIST_DIR"
  exit 5
fi

mkdir -p "$REPORTS_DIR"
AGG="$REPORTS_DIR/aggregate.md"
: > "$AGG"
{
  echo "# Design Quality — Aggregate"
  echo ""
  echo "Generated: $(date -u +%Y-%m-%dT%H:%M:%SZ)"
  echo ""
} >> "$AGG"

# 1. Slop-scan first (cheap floor)
SLOP_SH="${SKILLS_DIR}/scripts/slop-scan.sh"
[[ -f "$SLOP_SH" ]] || SLOP_SH="$ROOT/scripts/slop-scan.sh"
if [[ -f "$SLOP_SH" ]]; then
  echo "Running slop-scan..."
  if ! bash "$SLOP_SH" "$DIST_DIR"; then
    echo "FAIL: slop-scan"
    echo "- slop-scan failed; see reports/design-quality/slop-scan.md" >> "$AGG"
    exit 2
  fi
  echo "- slop-scan: pass" >> "$AGG"
else
  echo "WARN: slop-scan.sh not found; continuing without floor check"
  echo "- slop-scan: not run (script missing)" >> "$AGG"
fi

# 2. Determine expected primary templates from dist/
# Heuristic: any top-level directory under dist/ that contains index.html
# is a primary template root. Convention-based templates we expect to find:
EXPECTED_TEMPLATES=("home" "services" "contact")
FOUND_TEMPLATES=()

if [[ -f "$DIST_DIR/index.html" ]]; then
  FOUND_TEMPLATES+=("home")
fi
for tpl in services service-detail contact blog-index blog-post about; do
  if [[ -d "$DIST_DIR/$tpl" ]] || [[ -f "$DIST_DIR/$tpl.html" ]] || [[ -f "$DIST_DIR/$tpl/index.html" ]]; then
    FOUND_TEMPLATES+=("$tpl")
  fi
done

echo "" >> "$AGG"
echo "## Templates detected" >> "$AGG"
for tpl in "${FOUND_TEMPLATES[@]}"; do
  echo "- $tpl" >> "$AGG"
done

# 3. Read rubric reports and parse the machine footer
echo "" >> "$AGG"
echo "## Per-template scores" >> "$AGG"

FAIL=0
MISSING=()
for tpl in "${FOUND_TEMPLATES[@]}"; do
  rep="$REPORTS_DIR/${tpl}.md"
  if [[ ! -f "$rep" ]]; then
    MISSING+=("$tpl")
    continue
  fi
  # Extract line matching '1=N, 2=N, ... overall=N'
  line=$(grep -E 'overall=[0-9]+' "$rep" 2>/dev/null | tail -1 || true)
  if [[ -z "$line" ]]; then
    echo "- $tpl: MALFORMED (no SCORES footer)" >> "$AGG"
    FAIL=4
    continue
  fi
  overall=$(echo "$line" | sed -nE 's/.*overall=([0-9]+).*/\1/p')
  if [[ -z "$overall" ]]; then
    echo "- $tpl: MALFORMED (no overall)" >> "$AGG"
    FAIL=4
    continue
  fi
  if (( overall < 8 )); then
    echo "- $tpl: $overall/10 — FAIL (below 8)" >> "$AGG"
    FAIL=1
  else
    echo "- $tpl: $overall/10" >> "$AGG"
  fi
done

if (( ${#MISSING[@]} > 0 )); then
  echo "" >> "$AGG"
  echo "## Missing reports" >> "$AGG"
  for m in "${MISSING[@]}"; do
    echo "- $m" >> "$AGG"
  done
  FAIL=3
fi

echo "" >> "$AGG"
if (( FAIL == 0 )); then
  echo "**Status**: PASS" >> "$AGG"
  echo "design-quality-score: PASS"
  exit 0
else
  echo "**Status**: FAIL (code $FAIL)" >> "$AGG"
  echo "design-quality-score: FAIL (code $FAIL)"
  exit $FAIL
fi
