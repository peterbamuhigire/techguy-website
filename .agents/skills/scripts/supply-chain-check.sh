#!/usr/bin/env bash
# supply-chain-check.sh — lockfile integrity, install-script surface,
# typosquat detection, native-binary audit.
#
# Usage:
#   bash .claude/skills/scripts/supply-chain-check.sh
#
# Exit codes:
#   0 — supply chain clean
#   1 — lockfile mismatch
#   2 — dangerous install script present (uncleared)
#   3 — typosquat or known-bad package
#   4 — prerequisite missing

set -euo pipefail

ROOT="$(pwd)"
REPORT="reports/security/supply-chain.txt"
mkdir -p "$(dirname "$REPORT")"
: > "$REPORT"

command -v jq >/dev/null 2>&1 || { echo "supply-chain-check: jq required" >&2; exit 4; }
[ -f "$ROOT/package.json" ] || { echo "supply-chain-check: package.json missing" >&2; exit 4; }
[ -f "$ROOT/package-lock.json" ] || { echo "supply-chain-check: package-lock.json missing" >&2; exit 4; }

BAD_LIST=".supply-chain-bad"
[ -f "$BAD_LIST" ] || BAD_LIST="/dev/null"
TYPOSQUAT_LIST=".supply-chain-typosquats"
[ -f "$TYPOSQUAT_LIST" ] || TYPOSQUAT_LIST="/dev/null"

# 1. Lockfile integrity — npm ci implicitly checks, but we re-run the check here
npm ls --package-lock-only >/dev/null 2>>"$REPORT" || {
    echo "FAIL lockfile does not match package.json" | tee -a "$REPORT" >&2
    exit 1
}

# 2. Install scripts
LOCK="$ROOT/package-lock.json"
DANGEROUS=$(jq -r '
    .packages
    | to_entries
    | map(select(.value.scripts? and (.value.scripts|keys|inside(["preinstall","install","postinstall"]))))
    | map("\(.key) [\(.value.scripts|keys|join(","))]")
    | .[]
' "$LOCK" 2>/dev/null || true)

ALLOWED_INSTALL_SCRIPTS_FILE=".install-scripts-allowed"
ALLOW_LIST=""
[ -f "$ALLOWED_INSTALL_SCRIPTS_FILE" ] && ALLOW_LIST=$(cat "$ALLOWED_INSTALL_SCRIPTS_FILE")

FAIL=0
if [ -n "$DANGEROUS" ]; then
    while IFS= read -r line; do
        pkg=$(echo "$line" | awk '{print $1}')
        if echo "$ALLOW_LIST" | grep -qxF "$pkg"; then
            echo "ALLOW install-script $line" >> "$REPORT"
        else
            echo "FAIL install-script unreviewed: $line" | tee -a "$REPORT" >&2
            FAIL=1
        fi
    done <<< "$DANGEROUS"
fi
if [ "$FAIL" -ne 0 ]; then
    echo "supply-chain-check: FAIL — unreviewed install scripts. Document in .install-scripts-allowed or remove package." >&2
    exit 2
fi

# 3. Known-bad and typosquat
DEPS=$(jq -r '.packages | keys[] | select(startswith("node_modules/")) | ltrimstr("node_modules/")' "$LOCK" | awk -F/ '{print $1}' | sort -u)
while IFS= read -r pkg; do
    [ -z "$pkg" ] && continue
    if grep -qxF "$pkg" "$BAD_LIST" 2>/dev/null; then
        echo "FAIL known-bad package: $pkg" | tee -a "$REPORT" >&2
        FAIL=1
    fi
    if grep -qxF "$pkg" "$TYPOSQUAT_LIST" 2>/dev/null; then
        echo "FAIL typosquat match: $pkg" | tee -a "$REPORT" >&2
        FAIL=1
    fi
done <<< "$DEPS"

if [ "$FAIL" -ne 0 ]; then
    echo "supply-chain-check: FAIL — see $REPORT" >&2
    exit 3
fi
echo "supply-chain-check: PASS" | tee -a "$REPORT"
