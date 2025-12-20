#!/usr/bin/env bash
set -e

MODE=${1:-install} # install | cleanup
LABEL="com.aabeborn.ghostty.theme"
DOMAIN="gui/$(id -u)"

# Resolve real home directory (do NOT trust $HOME)
USER_HOME="$(dscl . -read /Users/$(id -un) NFSHomeDirectory | awk '{print $2}')"
PLIST="$USER_HOME/Library/LaunchAgents/$LABEL.plist"

log() {
  echo "→ $1"
}

is_macos() {
  [[ "$(uname)" == "Darwin" ]]
}

# launchd is happy with symlinks, so we explicitly allow them
plist_exists() {
  [[ -L "$PLIST" ]] || [[ -f "$PLIST" ]]
}

is_loaded() {
  launchctl list | grep -q "$LABEL"
}

install() {
  log "🔍 Using plist: $PLIST"

  if ! plist_exists; then
    log "⏭  Skipping launchd (plist not found)"
    return
  fi

  if is_loaded; then
    log "👻 launchd agent already loaded"
    return
  fi

  log "👻 Loading Ghostty theme sync agent"
  launchctl bootstrap "$DOMAIN" "$PLIST"
}

cleanup() {
  if is_loaded; then
    log "🧹 Unloading Ghostty theme sync agent"
    launchctl bootout "$DOMAIN" "$PLIST"
  else
    log "⏭  launchd agent not loaded"
  fi
}

case "$MODE" in
  install)
    is_macos && install || log "⏭  launchd skipped (not macOS)"
    ;;
  cleanup)
    is_macos && cleanup || log "⏭  launchd cleanup skipped (not macOS)"
    ;;
  *)
    echo "Usage: launchd.sh [install|cleanup]"
    exit 1
    ;;
esac
