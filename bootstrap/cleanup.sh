#!/usr/bin/env bash

set -e

# 🧹 Dotfiles cleanup script
# Reverts symlink state. No side effects. 😌

export DRY_RUN=${DRY_RUN:-0}
export DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

log() {
  echo "→ $1"
}

[ "$DRY_RUN" -eq 1 ] && log "🧪 Dry-run mode enabled"

log "👻 Cleaning up launchd agents"
"$DOTFILES_DIR/bootstrap/launchd.sh" cleanup

# 🧹 Symlinks
log "🧹 Cleaning up symlinks"
bash "$DOTFILES_DIR/bootstrap/symlink.sh" cleanup

log "✅ Cleanup complete"
