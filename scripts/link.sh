#!/usr/bin/env bash
# 🔗 Symlink manager.
#
#   link.sh install   create or refresh links
#   link.sh cleanup   remove links that point into this repo
#   link.sh status    show the state of every link
#
# DRY_RUN=1 prints what would happen without touching anything.
# Real files are never overwritten: they are reported as conflicts.

set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
MODE="${1:-install}"
DRY_RUN="${DRY_RUN:-0}"

# 🗺  Symlink map (single source of truth)
#   repo path (relative)  |  destination (absolute)
LINKS=(
  "config/zsh/zshrc|$HOME/.zshrc"
  "config/zsh/zshenv|$HOME/.zshenv"
  "config/zsh|$HOME/.config/zsh"
  "config/git|$HOME/.config/git"
  "config/zed|$HOME/.config/zed"
)

CONFLICTS=0

log() { printf '→ %s\n' "$1"; }

# Run a command, or only print it in dry-run mode.
run() {
  if [[ "$DRY_RUN" == 1 ]]; then
    log "[dry-run] $*"
  else
    "$@"
  fi
}

# Is this path a symlink into this repo?
is_ours() {
  [[ -L "$1" && "$(readlink "$1")" == "$DOTFILES_DIR"/* ]]
}

install_link() {
  local src="$1" dest="$2"

  if [[ -L "$dest" ]]; then
    local current
    current="$(readlink "$dest")"
    if [[ "$current" == "$src" ]]; then
      log "✅ Up to date: $dest"
      return
    fi
    # Stale or broken link we own: replace it. Foreign links are left alone.
    if [[ "$current" == "$DOTFILES_DIR"/* || ! -e "$dest" ]]; then
      log "🔄 Replacing link: $dest"
      run rm "$dest"
    else
      log "⚠️  Conflict: $dest is a symlink to $current (not this repo). Skipped."
      CONFLICTS=$((CONFLICTS + 1))
      return
    fi
  elif [[ -e "$dest" ]]; then
    log "⚠️  Conflict: $dest exists and is not a symlink. Move it aside and re-run. Skipped."
    CONFLICTS=$((CONFLICTS + 1))
    return
  fi

  run mkdir -p "$(dirname "$dest")"
  run ln -s "$src" "$dest"
  log "🔗 Linked $dest"
}

cleanup_link() {
  local dest="$1"
  if is_ours "$dest"; then
    run rm "$dest"
    log "🧹 Removed $dest"
  else
    log "⏭  Not ours, left alone: $dest"
  fi
}

status_link() {
  local src="$1" dest="$2"
  if [[ "$(readlink "$dest" 2>/dev/null)" == "$src" ]]; then
    log "✅ linked   $dest"
  elif [[ -L "$dest" ]]; then
    log "⚠️  foreign  $dest -> $(readlink "$dest")"
  elif [[ -e "$dest" ]]; then
    log "⚠️  file     $dest (not linked)"
  else
    log "·  missing  $dest"
  fi
}

case "$MODE" in
  install|cleanup|status) ;;
  *)
    echo "Usage: link.sh [install|cleanup|status]" >&2
    exit 1
    ;;
esac

for entry in "${LINKS[@]}"; do
  src="$DOTFILES_DIR/${entry%%|*}"
  dest="${entry##*|}"

  case "$MODE" in
    install) install_link "$src" "$dest" ;;
    cleanup) cleanup_link "$dest" ;;
    status)  status_link "$src" "$dest" ;;
  esac
done

if [[ "$MODE" == install && "$CONFLICTS" -gt 0 ]]; then
  log "❌ $CONFLICTS conflict(s). Resolve them and run again."
  exit 1
fi

log "✅ link: $MODE done"
