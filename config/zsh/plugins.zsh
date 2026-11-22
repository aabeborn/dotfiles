# ✨ plugins.zsh — shell plugins from Homebrew. Loaded last by zshrc.

BREW_SHARE="${HOMEBREW_PREFIX:-/opt/homebrew}/share"

# 💡 Autosuggestions from history
[[ -r "$BREW_SHARE/zsh-autosuggestions/zsh-autosuggestions.zsh" ]] \
  && source "$BREW_SHARE/zsh-autosuggestions/zsh-autosuggestions.zsh"

# 🎨 Syntax highlighting. Must be the final source.
[[ -r "$BREW_SHARE/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]] \
  && source "$BREW_SHARE/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
