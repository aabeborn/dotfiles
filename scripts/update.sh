#!/usr/bin/env bash
# 🔄 Update everything this repo installs:
#   Homebrew formulae and casks, global bun packages, and the global Node (latest LTS).
# DRY_RUN=1 shows the steps without running them.

set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
DRY_RUN="${DRY_RUN:-0}"

# pnpm's global bin is not on PATH in non-interactive runs.
export PATH="$HOME/Library/pnpm/bin:$PATH"

log() { printf '→ %s\n' "$1"; }

# Run a command, or only print it in dry-run mode.
run() {
  if [[ "$DRY_RUN" == 1 ]]; then
    log "[dry-run] $*"
  else
    "$@"
  fi
}

# 🍺 Homebrew
log "🍺 Homebrew"
run brew update
run brew upgrade
run brew cleanup

# 🥟 Global bun packages, pinned to @latest
if command -v bun >/dev/null 2>&1; then
  log "🥟 Global bun packages"
  while IFS= read -r line; do
    pkg="${line%%#*}"                     # drop trailing comments
    pkg="${pkg//[[:space:]]/}"            # drop whitespace
    [[ -z "$pkg" ]] && continue
    run bun add -g "$pkg@latest"
  done < "$DOTFILES_DIR/scripts/bun-globals.txt"
fi

# 🟢 Global Node: newest LTS, from nodejs.org's release index
log "🟢 Node (latest LTS)"
latest_lts="$(curl -fsS https://nodejs.org/dist/index.json | python3 -c '
import json, sys
print(next(e["version"][1:] for e in json.load(sys.stdin) if e["lts"] and "-" not in e["version"]))
')"
current="$(node --version 2>/dev/null | sed 's/^v//' || true)"

if [[ "$latest_lts" == "$current" ]]; then
  log "✅ Node is already $current"
else
  log "🔄 Node $current → $latest_lts"
  run pnpm runtime set node "$latest_lts" -g -y
fi

log "✅ update done"
