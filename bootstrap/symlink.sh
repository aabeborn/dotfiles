#!/usr/bin/env bash

set -e

# 🔗 Dotfiles symlink manager
# install | cleanup
# Calm. Explicit. Reversible. 😌

MODE=${1:-install} # install | cleanup
DRY_RUN=${DRY_RUN:-0}
DOTFILES_DIR="${DOTFILES_DIR:-$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)}"

log() {
  echo "→ $1"
}

action() {
  if [ "$DRY_RUN" -eq 1 ]; then
    echo "[dry-run] $1"
  else
    eval "$1"
  fi
}

# 🔗 Low-level helpers
link_file() {
  local src="$1"
  local dest="$2"

  if [ -e "$dest" ] && [ ! -L "$dest" ]; then
    log "⏭  Skipping $dest (already exists)"
    return
  fi

  mkdir -p "$(dirname "$dest")"
  action "ln -sf '$src' '$dest'"
  log "🔗 Linked $dest"
}

remove_link() {
  local dest="$1"

  if [ -L "$dest" ]; then
    action "rm '$dest'"
    log "🧹 Removed $dest"
  else
    log "⏭  Skipping $dest (not a symlink)"
  fi
}

# 🗺️ Symlink map (single source of truth)
# source (relative to repo) -> destination (absolute)
# 🗺️ Symlink map (source | destination)
SYMLINKS=(
  "config/git|$HOME/.config/git"
  "config/zsh/zshrc|$HOME/.zshrc"
)

apply_links() {
  for entry in "${SYMLINKS[@]}"; do
    src="${entry%%|*}"
    dest="${entry##*|}"
    link_file "$DOTFILES_DIR/$src" "$dest"
  done
}

remove_links() {
  for entry in "${SYMLINKS[@]}"; do
    dest="${entry##*|}"
    remove_link "$dest"
  done
}

log "🧰 Symlink mode: $MODE"
[ "$DRY_RUN" -eq 1 ] && log "🧪 Dry-run mode enabled"

case "$MODE" in
  install)
    log "🔗 Installing symlinks"
    apply_links
    ;;
  cleanup)
    log "🧹 Cleaning up symlinks"
    remove_links
    ;;
  *)
    echo "Usage: symlink.sh [install|cleanup]"
    exit 1
    ;;
esac

log "✅ Symlink operation complete"
