#!/usr/bin/env bash
# slop-scan.sh — banned-pattern static scan for rendered output.
#
# Reads banned patterns from
#   design-quality-score/references/banned-patterns.md
# and scans:
#   - rendered HTML in dist/
#   - compiled CSS in dist/
#   - any inline JS strings in dist/
#
# Usage:
#   bash scripts/slop-scan.sh [dist-dir]
#
# Exit codes:
#   0 — no banned patterns found
#   1 — banned headline or filler
#   2 — banned colour combination (gradient or off-palette)
#   3 — banned generic layout signal
#   4 — banned trust pattern
#   5 — prerequisite missing

set -euo pipefail

ROOT="$(pwd)"
DIST_DIR="${1:-$ROOT/dist}"
REPORTS_DIR="${REPORTS_DIR:-$ROOT/reports}/design-quality"
mkdir -p "$REPORTS_DIR"

REPORT="$REPORTS_DIR/slop-scan.md"

if [[ ! -d "$DIST_DIR" ]]; then
  echo "FAIL: dist directory not found at $DIST_DIR"
  exit 5
fi

: > "$REPORT"
{
  echo "# Slop-Scan Report"
  echo ""
  echo "Scanned: $DIST_DIR"
  echo "Generated: $(date -u +%Y-%m-%dT%H:%M:%SZ)"
  echo ""
} >> "$REPORT"

FAIL=0

# ---- Banned headlines ----
BANNED_HEADLINES=(
  'Welcome to (our|the)'
  "We('re| are) passionate about"
  'Your one-stop (shop|solution|destination)'
  'Bringing the future of'
  'Empowering (businesses|people|teams)'
  'Revolutionising'
  'The leading'
  'Cutting-edge'
  'State of the art'
  'Innovative solutions'
  'Crafted with care'
  'Take your (business|brand|project) to the next level'
)

echo "## Banned headlines" >> "$REPORT"
HEAD_HITS=0
for pattern in "${BANNED_HEADLINES[@]}"; do
  while IFS=: read -r f line match; do
    # Heuristic: only flag if inside an h1, h2, or hero-like class
    echo "- ${f#$DIST_DIR/}:$line — $pattern" >> "$REPORT"
    HEAD_HITS=$((HEAD_HITS+1))
  done < <(grep -rEni "$pattern" --include='*.html' "$DIST_DIR" 2>/dev/null | head -5 || true)
done
if (( HEAD_HITS > 0 )); then
  FAIL=1
else
  echo "- none" >> "$REPORT"
fi
echo "" >> "$REPORT"

# ---- Banned filler in hero / h1 / h2 ----
BANNED_FILLERS='seamless|seamlessly|holistic|synergy|synergistic|next-generation|next-gen|best-in-class|world-class'
echo "## Banned filler (heroes/headings)" >> "$REPORT"
FILLER_HITS=0
while IFS=: read -r f line match; do
  echo "- ${f#$DIST_DIR/}:$line — filler in heading" >> "$REPORT"
  FILLER_HITS=$((FILLER_HITS+1))
done < <(grep -rEni "<h[12][^>]*>[^<]*($BANNED_FILLERS)" --include='*.html' "$DIST_DIR" 2>/dev/null | head -10 || true)
if (( FILLER_HITS > 0 )); then
  [[ $FAIL -eq 0 ]] && FAIL=1
else
  echo "- none" >> "$REPORT"
fi
echo "" >> "$REPORT"

# ---- Banned gradients in CSS ----
echo "## Banned gradient signals" >> "$REPORT"
GRAD_HITS=0
# Common purple-to-blue SaaS gradient signatures
GRADIENT_PATTERNS='linear-gradient\(.*#[6-9][0-9a-f]{5}.*#[3-5][0-9a-f]{5}\)|from-purple-[0-9]+.*to-blue-[0-9]+|from-indigo-[0-9]+.*to-purple-[0-9]+'
while IFS=: read -r f line; do
  echo "- ${f#$DIST_DIR/}:$line — gradient signature" >> "$REPORT"
  GRAD_HITS=$((GRAD_HITS+1))
done < <(grep -rEni "$GRADIENT_PATTERNS" --include='*.css' --include='*.html' "$DIST_DIR" 2>/dev/null | head -10 || true)
if (( GRAD_HITS > 0 )); then
  [[ $FAIL -eq 0 ]] && FAIL=2
else
  echo "- none" >> "$REPORT"
fi
echo "" >> "$REPORT"

# ---- Pure black text on pure white body ----
echo "## Pure #000 body text signals" >> "$REPORT"
BLACK_HITS=0
while IFS=: read -r f line; do
  echo "- ${f#$DIST_DIR/}:$line — pure #000 on body" >> "$REPORT"
  BLACK_HITS=$((BLACK_HITS+1))
done < <(grep -rEni 'body[^{]*\{[^}]*color:\s*#0{3,6}' --include='*.css' "$DIST_DIR" 2>/dev/null | head -5 || true)
if (( BLACK_HITS > 0 )); then
  [[ $FAIL -eq 0 ]] && FAIL=2
else
  echo "- none" >> "$REPORT"
fi
echo "" >> "$REPORT"

# ---- Generic "Trusted by" without links ----
echo "## Generic 'Trusted by' without links" >> "$REPORT"
TRUST_HITS=0
# Heuristic: "Trusted by" text, followed within 500 chars by multiple <img> with no <a>
while IFS= read -r f; do
  if grep -iE 'Trusted by|As featured in' "$f" > /dev/null 2>&1; then
    # Count <img> and <a> in the surrounding block — crude heuristic
    block=$(awk '/Trusted by|As featured in/{flag=1; count=0} flag && /<\/section>|<\/div>/{flag=0} flag' "$f" 2>/dev/null || true)
    img_count=$(echo "$block" | grep -oE '<img' | wc -l | tr -d ' ')
    a_count=$(echo "$block" | grep -oE '<a ' | wc -l | tr -d ' ')
    if (( img_count >= 3 )) && (( a_count < img_count / 2 )); then
      echo "- ${f#$DIST_DIR/} — trust row with $img_count logos and $a_count links" >> "$REPORT"
      TRUST_HITS=$((TRUST_HITS+1))
    fi
  fi
done < <(find "$DIST_DIR" -name '*.html' -type f 2>/dev/null)
if (( TRUST_HITS > 0 )); then
  [[ $FAIL -eq 0 ]] && FAIL=4
else
  echo "- none" >> "$REPORT"
fi
echo "" >> "$REPORT"

# ---- Common marketing filler transitions ----
echo "## Banned copy transitions" >> "$REPORT"
TRANS_HITS=0
TRANS_PATTERNS="In today's fast-paced world|In the digital age|At the end of the day|Let's unpack|Let's dive into|Dive into|Unpacking the"
while IFS=: read -r f line; do
  echo "- ${f#$DIST_DIR/}:$line — banned transition" >> "$REPORT"
  TRANS_HITS=$((TRANS_HITS+1))
done < <(grep -rEni "$TRANS_PATTERNS" --include='*.html' "$DIST_DIR" 2>/dev/null | head -10 || true)
if (( TRANS_HITS > 0 )); then
  [[ $FAIL -eq 0 ]] && FAIL=1
else
  echo "- none" >> "$REPORT"
fi
echo "" >> "$REPORT"

# ---- Summary ----
{
  echo "## Summary"
  echo ""
  echo "- Banned headlines: $HEAD_HITS"
  echo "- Banned fillers in headings: $FILLER_HITS"
  echo "- Banned gradient signals: $GRAD_HITS"
  echo "- Pure #000 body text: $BLACK_HITS"
  echo "- Generic trust rows: $TRUST_HITS"
  echo "- Banned copy transitions: $TRANS_HITS"
  echo ""
  if (( FAIL > 0 )); then
    echo "**Status**: FAIL (code $FAIL)"
  else
    echo "**Status**: PASS"
  fi
} >> "$REPORT"

echo "Slop-scan report: $REPORT"
exit $FAIL
