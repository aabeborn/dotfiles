#!/usr/bin/env bash
# 🚀 Install entry point. Packages, then links. Each step lives in its own script.

set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
export DRY_RUN="${DRY_RUN:-0}"

log() { printf '→ %s\n' "$1"; }

if [[ "$DRY_RUN" == 1 ]]; then
  log "🧪 Dry-run mode"
fi

if ! command -v brew >/dev/null 2>&1; then
  log "❌ Homebrew not found. Install it from https://brew.sh, then re-run."
  exit 1
fi

if [[ "$DRY_RUN" == 1 ]]; then
  log "[dry-run] brew bundle --file Brewfile"
else
  log "📦 Installing Homebrew packages"
  brew bundle --file "$DOTFILES_DIR/Brewfile"
fi

# 🥟 Global bun packages (list in scripts/bun-globals.txt)
if command -v bun >/dev/null 2>&1; then
  while IFS= read -r line; do
    pkg="${line%%#*}"                     # drop trailing comments
    pkg="${pkg//[[:space:]]/}"            # drop whitespace
    [[ -z "$pkg" ]] && continue
    if [[ "$DRY_RUN" == 1 ]]; then
      log "[dry-run] bun add -g $pkg"
    else
      log "🥟 bun add -g $pkg"
      bun add -g "$pkg"
    fi
  done < "$DOTFILES_DIR/scripts/bun-globals.txt"
else
  log "⚠️  bun not found; skipping global packages"
fi

log "🔗 Linking configs"
"$DOTFILES_DIR/scripts/link.sh" install

log "✅ Install complete. Open a new terminal, or run: restart"
