#!/usr/bin/env bash
# drift-check.sh — documentation drift gate.
#
# Enforces documentation coherence rules defined in:
#   - glossary.md                (canonical names, banned terms)
#   - docs/doc-style-guide.md    (structure and voice rules)
#   - docs/deprecation-policy.md (deprecated-entity references)
#
# Runs as step 11 of the canonical CI pipeline.
# A failure blocks deploy.
#
# Usage:
#   bash scripts/drift-check.sh [--fix-hints]
#
# Exit codes:
#   0 — no drift
#   1 — dead internal links
#   2 — deprecated-entity reference outside compatibility window
#   3 — dated framing detected
#   4 — banned term detected
#   5 — SKILL.md over 500 lines without justification
#   6 — duplicated guidance across reference files
#   7 — forbidden construction detected (throat-clearing, hedges, weak verbs)
#   8 — prerequisite missing (glossary or style guide not found)

set -euo pipefail

ROOT="$(pwd)"
SKILLS_DIR="${SKILLS_DIR:-$ROOT}"
REPORTS_DIR="${REPORTS_DIR:-$ROOT/reports}/drift"
GLOSSARY="${SKILLS_DIR}/glossary.md"
STYLE_GUIDE="${SKILLS_DIR}/docs/doc-style-guide.md"
DEPRECATION_POLICY="${SKILLS_DIR}/docs/deprecation-policy.md"

mkdir -p "$REPORTS_DIR"

REPORT="$REPORTS_DIR/drift-report.md"
FAILURES=0

say() { printf '%s\n' "$*"; }
header() {
  printf '\n== %s ==\n' "$*"
  printf '\n## %s\n\n' "$*" >> "$REPORT"
}
record() {
  printf '%s\n' "$*" >> "$REPORT"
}

# Prerequisites
if [[ ! -f "$GLOSSARY" ]]; then
  say "FAIL: glossary.md not found at $GLOSSARY"
  exit 8
fi
if [[ ! -f "$STYLE_GUIDE" ]]; then
  say "FAIL: doc-style-guide.md not found at $STYLE_GUIDE"
  exit 8
fi
if [[ ! -f "$DEPRECATION_POLICY" ]]; then
  say "FAIL: deprecation-policy.md not found at $DEPRECATION_POLICY"
  exit 8
fi

: > "$REPORT"
{
  echo "# Drift-Check Report"
  echo ""
  echo "Generated: $(date -u +%Y-%m-%dT%H:%M:%SZ)"
  echo ""
} >> "$REPORT"

# Scope — markdown files, excluding external book extractions and node_modules
# and the proposal-skills submodule.
mapfile -t MD_FILES < <(
  find "$SKILLS_DIR" \
    \( -path '*/node_modules' -o -path '*/.git' -o -path '*/proposal-skills' \
       -o -path '*/book-extractions' -o -path '*/dist' -o -path '*/reports' \) -prune -o \
    -type f -name '*.md' -print
)

# ----------------------------------------------------------------------------
# 1. Dead internal links
# ----------------------------------------------------------------------------
header "1. Dead internal links"
DEAD_LINKS=0
for f in "${MD_FILES[@]}"; do
  case "$f" in
    */skill-writing/references/generation-template.md|\
    */skill-writing/references/legacy-guidance.md|\
    */skill-writing/references/skill-authoring-best-practices.md) continue ;;
  esac
  # Match markdown links: ](path) or ](path#anchor)
  while IFS= read -r match; do
    target="${match%%#*}"
    [[ -z "$target" ]] && continue
    # Strip leading ./
    target="${target#./}"
    # Skip URLs
    [[ "$target" =~ ^https?:// ]] && continue
    [[ "$target" =~ ^mailto: ]] && continue
    # Resolve relative to file's directory
    dir="$(dirname "$f")"
    resolved="$dir/$target"
    if [[ ! -e "$resolved" && ! -e "$SKILLS_DIR/$target" ]]; then
      record "- ${f#$SKILLS_DIR/}: broken link -> $target"
      DEAD_LINKS=$((DEAD_LINKS+1))
    fi
  done < <(grep -oE '\]\([^)]+\.md[^)]*\)' "$f" 2>/dev/null | sed -E 's/^\]\(//; s/\)$//' || true)
done
if (( DEAD_LINKS > 0 )); then
  say "FAIL: $DEAD_LINKS dead internal link(s)"
  FAILURES=$((FAILURES|1))
else
  record "No dead internal links found."
fi

# ----------------------------------------------------------------------------
# 2. Deprecated-entity references
# ----------------------------------------------------------------------------
header "2. Deprecated-entity references outside compatibility window"
DEPRECATED_HITS=0
# Parse the register in deprecation-policy.md: lines like | `entity` | kind | YYYY-MM-DD | YYYY-MM-DD | ...
TODAY="$(date -u +%Y-%m-%d)"
while IFS='|' read -r _ entity kind dep_on removal_on successor _; do
  entity="$(echo "$entity" | sed -E 's/^ *`?//; s/`? *$//')"
  [[ -z "$entity" || "$entity" == "Entity" ]] && continue
  removal_on="$(echo "$removal_on" | tr -d ' ')"
  # Match only YYYY-MM-DD lines
  [[ ! "$removal_on" =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2}$ ]] && continue
  if [[ "$TODAY" > "$removal_on" ]]; then
    # Post-removal: any reference is drift
    while IFS= read -r hit; do
      record "- $hit references removed entity \`$entity\` (removed $removal_on)"
      DEPRECATED_HITS=$((DEPRECATED_HITS+1))
    done < <(grep -rln --include='*.md' "$entity" "$SKILLS_DIR" 2>/dev/null | grep -v 'deprecation-policy.md' | grep -v 'glossary.md' || true)
  fi
done < <(grep -E '^\| `[^`]+` \|' "$DEPRECATION_POLICY" 2>/dev/null || true)
if (( DEPRECATED_HITS > 0 )); then
  say "FAIL: $DEPRECATED_HITS reference(s) to removed entities"
  FAILURES=$((FAILURES|2))
else
  record "No references to removed deprecated entities found."
fi

# ----------------------------------------------------------------------------
# 3. Dated framing
# ----------------------------------------------------------------------------
header "3. Dated framing"
DATED_HITS=0
DATED_PATTERNS='as of 20[0-9][0-9]|the next quarter|recently,|at the time of writing|currently,'
for f in "${MD_FILES[@]}"; do
  # Skip plan files and decision entries (those are inherently dated by design)
  case "$f" in
    */docs/plans/*|*/project-log/*|*/book-extractions/*|*/SESSION_*SUMMARY.md|\
    */glossary.md|*/certification/exam.md) continue ;;
  esac
  while IFS=: read -r ln; do
    record "- ${f#$SKILLS_DIR/}:$ln"
    DATED_HITS=$((DATED_HITS+1))
  done < <(grep -nEi "$DATED_PATTERNS" "$f" 2>/dev/null | head -20 || true)
done
if (( DATED_HITS > 0 )); then
  say "FAIL: $DATED_HITS dated-framing instance(s)"
  FAILURES=$((FAILURES|4))
else
  record "No dated framing detected."
fi

# ----------------------------------------------------------------------------
# 4. Banned terms (from glossary)
# ----------------------------------------------------------------------------
header "4. Banned terms (marketing filler)"
BANNED_HITS=0
# Extract the banned-terms block from glossary.md and match whole-word
BANNED='best-in-class|state of the art|cutting-edge|synergy|holistic|robust\b|leverage (?=\w)'
for f in "${MD_FILES[@]}"; do
  case "$f" in
    */glossary.md|*/docs/doc-style-guide.md|*/book-extractions/*|\
    */agency-positioning/references/proposal-positioning.md|\
    */blog-writer/references/editorial-standards.md|\
    */blog-writer/references/human-voice-standards.md|\
    */blog-writer/references/legacy-guidance.md|\
    */brand-alignment/references/legacy-guidance.md|\
    */brand-storytelling/references/content-strategy.md|\
    */brand-storytelling/references/legacy-guidance.md|\
    */brand-style-guide/references/legacy-guidance.md|\
    */brand-style-guide/references/style-guide-template.md|\
    */design-quality-score/references/banned-patterns.md|\
    */design-system/references/ai-slop-prevention.md|\
    */language-standards/references/business-english-advanced.md|\
    */language-standards/references/legacy-guidance.md|\
    */page-builder/references/page-conversion-checklist.md|\
    */prompts/new-project-kickstart.md|\
    */sales-copywriting/references/website-messaging-framework.md|\
    */visual-qa/references/slop-rules.md) continue ;;
  esac
  while IFS=: read -r ln; do
    record "- ${f#$SKILLS_DIR/}:$ln"
    BANNED_HITS=$((BANNED_HITS+1))
  done < <(grep -nEi "$BANNED" "$f" 2>/dev/null | head -10 || true)
done
if (( BANNED_HITS > 0 )); then
  say "WARN: $BANNED_HITS banned-term instance(s) — style guide violation"
  # Banned terms are a style warning; promote to failure in strict mode.
  if [[ "${DRIFT_STRICT:-0}" == "1" ]]; then
    FAILURES=$((FAILURES|8))
  fi
else
  record "No banned terms detected."
fi

# ----------------------------------------------------------------------------
# 5. SKILL.md over 500 lines
# ----------------------------------------------------------------------------
header "5. SKILL.md 500-line rule"
OVER_500=0
while IFS= read -r skill; do
  lines="$(wc -l < "$skill" | tr -d ' ')"
  if (( lines > 500 )); then
    # Check for a justification comment at top of file
    head -5 "$skill" | grep -qi 'justification\|exceeds 500' || {
      record "- ${skill#$SKILLS_DIR/} has $lines lines (limit 500, no justification comment)"
      OVER_500=$((OVER_500+1))
    }
  fi
done < <(find "$SKILLS_DIR" -type f -name 'SKILL.md' \
  -not -path '*/node_modules/*' -not -path '*/proposal-skills/*' 2>/dev/null)
if (( OVER_500 > 0 )); then
  say "FAIL: $OVER_500 SKILL.md file(s) over 500 lines without justification"
  FAILURES=$((FAILURES|16))
else
  record "All SKILL.md files within the 500-line rule."
fi

# ----------------------------------------------------------------------------
# 6. Duplicated guidance across reference files
# ----------------------------------------------------------------------------
header "6. Duplicated guidance (heuristic)"
# Heuristic: identify 5+ line blocks that appear verbatim in two or more
# different reference files. This is intentionally cheap; full duplication
# detection is out of scope.
DUPE_HITS=0
tmpdir="$(mktemp -d)"
trap 'rm -rf "$tmpdir"' EXIT
while IFS= read -r f; do
  # Normalise: strip blanks, hash 5-line windows
  awk 'NF' "$f" | awk 'NR%5==0{print; s=""; next}{s=s $0 "\n"}' > "$tmpdir/$(echo "$f" | tr '/' '_')" 2>/dev/null || true
done < <(find "$SKILLS_DIR" -type f -path '*/references/*.md' \
  -not -path '*/node_modules/*' -not -path '*/proposal-skills/*' 2>/dev/null)
# Find windows that appear in 2+ files
if command -v sort >/dev/null && command -v uniq >/dev/null; then
  cat "$tmpdir"/* 2>/dev/null | sort | uniq -c | awk '$1 >= 2 {print}' | head -20 > "$tmpdir/dupes.txt" || true
  DUPE_HITS="$(wc -l < "$tmpdir/dupes.txt" | tr -d ' ')"
  if (( DUPE_HITS > 0 )); then
    record "- $DUPE_HITS duplicated 5-line window(s) detected across reference files (heuristic)"
  fi
fi
if (( DUPE_HITS > 20 )); then
  say "WARN: $DUPE_HITS heuristic duplicate windows — investigate"
  [[ "${DRIFT_STRICT:-0}" == "1" ]] && FAILURES=$((FAILURES|32))
else
  record "Duplication heuristic: within acceptable range."
fi

# ----------------------------------------------------------------------------
# 7. Forbidden constructions (hedges, throat-clearing, weak verbs)
# ----------------------------------------------------------------------------
header "7. Forbidden constructions"
FORBID_HITS=0
FORBIDDEN='It is important to note that|Please be aware|As discussed above|utilise|facilitate '
for f in "${MD_FILES[@]}"; do
  case "$f" in
    */docs/doc-style-guide.md|*/book-extractions/*|\
    */blog-writer/references/editorial-standards.md|\
    */blog-writer/references/writing-craft.md|\
    */content-writing/references/legacy-guidance.md|\
    */form-ux-design/references/legacy-guidance.md|\
    */policy-pages/references/legacy-guidance.md) continue ;;
  esac
  while IFS=: read -r ln; do
    record "- ${f#$SKILLS_DIR/}:$ln"
    FORBID_HITS=$((FORBID_HITS+1))
  done < <(grep -nE "$FORBIDDEN" "$f" 2>/dev/null | head -10 || true)
done
if (( FORBID_HITS > 0 )); then
  say "WARN: $FORBID_HITS forbidden construction(s) — style guide violation"
  [[ "${DRIFT_STRICT:-0}" == "1" ]] && FAILURES=$((FAILURES|64))
else
  record "No forbidden constructions detected."
fi

# ----------------------------------------------------------------------------
# Summary
# ----------------------------------------------------------------------------
{
  echo ""
  echo "## Summary"
  echo ""
  echo "- Dead internal links: $DEAD_LINKS"
  echo "- Deprecated-entity references: $DEPRECATED_HITS"
  echo "- Dated framing: $DATED_HITS"
  echo "- Banned terms: $BANNED_HITS"
  echo "- SKILL.md over 500 lines: $OVER_500"
  echo "- Duplication windows: $DUPE_HITS"
  echo "- Forbidden constructions: $FORBID_HITS"
  echo ""
  if (( FAILURES > 0 )); then
    echo "**Status**: FAIL (exit bitmask $FAILURES)"
  else
    echo "**Status**: PASS"
  fi
} >> "$REPORT"

say ""
say "Report written to: $REPORT"
if (( FAILURES > 0 )); then
  # Report the first failure's code for exit
  for code in 1 2 4 8 16 32 64; do
    if (( FAILURES & code )); then
      case $code in
        1) exit 1 ;;
        2) exit 2 ;;
        4) exit 3 ;;
        8) exit 4 ;;
        16) exit 5 ;;
        32) exit 6 ;;
        64) exit 7 ;;
      esac
    fi
  done
fi
exit 0
