#!/usr/bin/env bash
# install-canonical-ci.sh — bootstrap the canonical CI pipeline into a client project.
#
# Copies the canonical workflow and the canonical npm scripts into a project
# that has .claude/skills/ mounted. Running this is the one-time setup step
# that signs the project up for the engine's enforcement gates.
#
# Usage:
#   bash .claude/skills/scripts/install-canonical-ci.sh <project-path>
#
# Idempotent. Re-running is safe; existing files are backed up to
# .engine-backup-<timestamp>/ before being overwritten.
#
# Exit codes:
#   0 — install complete
#   1 — project path invalid
#   2 — no skills submodule at <project-path>/.claude/skills/
#   3 — user declined to overwrite existing workflow

set -euo pipefail

PROJECT="${1:-}"
if [ -z "$PROJECT" ] || [ ! -d "$PROJECT" ]; then
    echo "usage: install-canonical-ci.sh <project-path>" >&2
    exit 1
fi

SKILLS="$PROJECT/.claude/skills"
if [ ! -d "$SKILLS" ]; then
    echo "install-canonical-ci: $SKILLS missing. Add the skills submodule first:" >&2
    echo "  git submodule add https://github.com/<org>/website-skills $SKILLS" >&2
    exit 2
fi

TS=$(date -u +%Y%m%d-%H%M%S)
BACKUP="$PROJECT/.engine-backup-$TS"

backup_if_present() {
    local src="$1"
    if [ -e "$src" ]; then
        mkdir -p "$BACKUP"
        cp -R "$src" "$BACKUP/"
        echo "install-canonical-ci: backed up $src → $BACKUP/"
    fi
}

# 1. Workflow
mkdir -p "$PROJECT/.github/workflows"
backup_if_present "$PROJECT/.github/workflows/website.yml"
cp "$SKILLS/templates/ci/website.yml" "$PROJECT/.github/workflows/website.yml"
echo "install-canonical-ci: workflow installed at .github/workflows/website.yml"

# 2. Lighthouse config
backup_if_present "$PROJECT/lighthouserc.json"
cp "$SKILLS/lighthouserc.json" "$PROJECT/lighthouserc.json"

# 3. Performance budgets
backup_if_present "$PROJECT/performance-budgets.json"
cp "$SKILLS/performance-budgets.json" "$PROJECT/performance-budgets.json"

# 4. Visual baseline stubs (directory contract only; actual baselines captured per project)
mkdir -p "$PROJECT/tests/visual"
cp -n "$SKILLS/tests/visual/baseline/README.md" "$PROJECT/tests/visual/baseline/README.md" 2>/dev/null || true
mkdir -p "$PROJECT/tests/visual/baseline"

# 5. Third-party allowlist (empty by default)
if [ ! -f "$PROJECT/.third-party-allowed" ]; then
    cat > "$PROJECT/.third-party-allowed" <<'EOF'
# Third-party asset allowlist.
# One origin per line. Add a hash-delimited one-line reason.
# The default is to ship with zero third-party runtime assets.
#
# Example:
# https://plausible.example.com  # self-hosted Plausible analytics
EOF
fi

# 6. package.json scripts — if jq is present, merge; otherwise print instructions.
if command -v jq >/dev/null 2>&1 && [ -f "$PROJECT/package.json" ]; then
    TMP=$(mktemp)
    jq '.scripts += {
        "perf-gate": "bash .claude/skills/scripts/perf-gate.sh",
        "a11y-gate": "bash .claude/skills/scripts/a11y-gate.sh",
        "visual-qa": "bash .claude/skills/scripts/visual-qa.sh",
        "security-gate": "bash .claude/skills/scripts/security-gate.sh",
        "drift-check": "bash .claude/skills/scripts/drift-check.sh",
        "design-score": "bash .claude/skills/scripts/design-quality-score.sh",
        "engine-gates": "npm run perf-gate && npm run a11y-gate && npm run visual-qa && npm run security-gate"
    }' "$PROJECT/package.json" > "$TMP"
    backup_if_present "$PROJECT/package.json"
    mv "$TMP" "$PROJECT/package.json"
    echo "install-canonical-ci: package.json scripts merged"
else
    echo "install-canonical-ci: jq not found or no package.json — add these scripts manually:" >&2
    echo '  "perf-gate": "bash .claude/skills/scripts/perf-gate.sh",' >&2
    echo '  "a11y-gate": "bash .claude/skills/scripts/a11y-gate.sh",' >&2
    echo '  "visual-qa": "bash .claude/skills/scripts/visual-qa.sh",' >&2
    echo '  "security-gate": "bash .claude/skills/scripts/security-gate.sh",' >&2
    echo '  "drift-check": "bash .claude/skills/scripts/drift-check.sh",' >&2
    echo '  "design-score": "bash .claude/skills/scripts/design-quality-score.sh",' >&2
    echo '  "engine-gates": "npm run perf-gate && npm run a11y-gate && npm run visual-qa && npm run security-gate"' >&2
fi

# 7. .gitignore additions
if [ -f "$PROJECT/.gitignore" ]; then
    for entry in 'reports/' '.engine-backup-*' '.lighthouseci/'; do
        grep -qxF "$entry" "$PROJECT/.gitignore" || echo "$entry" >> "$PROJECT/.gitignore"
    done
fi

cat <<EOF

install-canonical-ci: done.

Next steps in this project:
  1. npm i -D @lhci/cli @axe-core/cli @playwright/test serve jq
  2. Capture initial visual baselines once the first template is designed:
     npx playwright test --update-snapshots tests/visual/capture.spec.ts
  3. Commit .github/workflows/website.yml, lighthouserc.json, performance-budgets.json,
     .third-party-allowed, and any backup folder after reviewing.
  4. Configure GitHub secrets: DEPLOY_HOST, DEPLOY_USER, DEPLOY_KEY.
  5. Configure GitHub variables: DEPLOY_PATH, PRODUCTION_URL.
  6. Trigger the workflow and verify every gate runs.

See .claude/skills/deploy/references/ci-troubleshooting.md for common issues.
EOF
