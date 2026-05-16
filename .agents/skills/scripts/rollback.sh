#!/usr/bin/env bash
# rollback.sh — automated rollback hook.
#
# Invoked by the canonical CI pipeline when deploy or post-deploy smoke
# fails. Flips the "current" symlink on the target host to the previous
# release directory, reloads the web server, and logs the outcome.
#
# Layout assumption on the target host:
#   $DEPLOY_PATH/releases/<timestamp>/   (each release)
#   $DEPLOY_PATH/current -> releases/<timestamp>   (atomic symlink)
#   $DEPLOY_PATH/previous -> releases/<timestamp>  (kept by deploy step)
#
# Environment:
#   DEPLOY_HOST   — SSH host
#   DEPLOY_USER   — SSH user
#   DEPLOY_KEY    — private key (passed via secret; written to ~/.ssh/ci_key)
#   DEPLOY_PATH   — remote webroot parent
#
# Usage:
#   bash .claude/skills/scripts/rollback.sh
#
# Exit codes:
#   0 — rollback succeeded
#   1 — rollback failed
#   3 — prerequisite missing

set -euo pipefail

: "${DEPLOY_HOST:?rollback: DEPLOY_HOST missing}"
: "${DEPLOY_USER:?rollback: DEPLOY_USER missing}"
: "${DEPLOY_KEY:?rollback: DEPLOY_KEY missing}"
: "${DEPLOY_PATH:?rollback: DEPLOY_PATH missing}"

LOG_DIR="reports/deploy"
mkdir -p "$LOG_DIR"
LOG="$LOG_DIR/rollback-$(date -u +%Y%m%dT%H%M%SZ).log"

KEY_FILE="$HOME/.ssh/ci_key"
mkdir -p "$HOME/.ssh"
chmod 700 "$HOME/.ssh"
echo "$DEPLOY_KEY" > "$KEY_FILE"
chmod 600 "$KEY_FILE"

SSH="ssh -o StrictHostKeyChecking=accept-new -i $KEY_FILE $DEPLOY_USER@$DEPLOY_HOST"

echo "rollback: starting against $DEPLOY_HOST:$DEPLOY_PATH" | tee "$LOG"

if ! $SSH "test -L $DEPLOY_PATH/previous" 2>>"$LOG"; then
    echo "rollback: FAIL — no previous release symlink at $DEPLOY_PATH/previous" | tee -a "$LOG" >&2
    exit 1
fi

# Capture the current target before swap for audit
CURRENT_TARGET=$($SSH "readlink $DEPLOY_PATH/current" 2>/dev/null || echo "<unknown>")
PREV_TARGET=$($SSH "readlink $DEPLOY_PATH/previous" 2>/dev/null || echo "<unknown>")

echo "rollback: current=$CURRENT_TARGET previous=$PREV_TARGET" | tee -a "$LOG"

# Atomic swap: point current → previous; previous → old current (so we can re-forward)
$SSH "cd $DEPLOY_PATH && ln -sfn $PREV_TARGET current.new && mv -T current.new current && ln -sfn $CURRENT_TARGET previous.new && mv -T previous.new previous" 2>>"$LOG"

# Web server reload — Nginx by default; override with RELOAD_CMD
RELOAD_CMD="${RELOAD_CMD:-sudo systemctl reload nginx}"
$SSH "$RELOAD_CMD" 2>>"$LOG"

echo "rollback: done. current now points to $PREV_TARGET. See $LOG" | tee -a "$LOG"
