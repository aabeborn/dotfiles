#!/usr/bin/env bash

set -e

# 🚀 Dotfiles install script
# Orchestrates setup steps. No logic lives here. 😌

export DRY_RUN=${DRY_RUN:-0}
export DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

log() {
  echo "→ $1"
}

# 🖥 Detect OS (reserved for future use)
case "$(uname -s)" in
  Darwin) OS="macos" ;;
  Linux)  OS="linux" ;;
  *) OS="unknown" ;;
esac

log "🖥  Detected OS: $OS"
[ "$DRY_RUN" -eq 1 ] && log "🧪 Dry-run mode enabled"

# 🔗 Symlinks
log "🔗 Installing symlinks"
bash "$DOTFILES_DIR/bootstrap/symlink.sh" install

log "👻 Setting up launchd agents"
"$DOTFILES_DIR/bootstrap/launchd.sh" install

log "✅ Install complete"
log "🔄 Restart your shell to apply changes"
