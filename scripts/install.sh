#!/usr/bin/env bash
# 🚀 Install entry point. Links first (they need no packages), then packages.
# Safe to re-run: installed packages are skipped, and links are refreshed.
# update.sh is the one that upgrades things.

set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
export DRY_RUN="${DRY_RUN:-0}"

log() { printf '→ %s\n' "$1"; }

if [[ "$DRY_RUN" == 1 ]]; then
  log "🧪 Dry-run mode"
fi

# 🔗 Links first: configs are usable even if a package step fails later
log "🔗 Linking configs"
"$DOTFILES_DIR/scripts/link.sh" install

# 🍺 Homebrew packages
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
FAILED=()
if command -v bun >/dev/null 2>&1; then
  installed="$(bun pm ls -g 2>/dev/null || true)"
  while IFS= read -r line; do
    pkg="${line%%#*}"                     # drop trailing comments
    pkg="${pkg//[[:space:]]/}"            # drop whitespace
    [[ -z "$pkg" ]] && continue

    if [[ "$DRY_RUN" == 1 ]]; then
      log "[dry-run] bun add -g $pkg (skipped if installed)"
    elif grep -qF "$pkg@" <<<"$installed"; then
      log "✅ Already installed: $pkg"
    else
      log "🥟 bun add -g $pkg"
      # A failure here must not stop the run. It is reported at the end.
      if ! bun add -g "$pkg"; then
        FAILED+=("$pkg")
      fi
    fi
  done < "$DOTFILES_DIR/scripts/bun-globals.txt"
else
  log "⚠️  bun not found; skipping global packages"
fi

if (( ${#FAILED[@]} )); then
  log "❌ Global bun packages failed: ${FAILED[*]}"
  log "   Fix the cause (for example a stale file in ~/.bun/bin), then re-run make install."
  exit 1
fi

log "✅ Install complete. Open a new terminal, or run: restart"
