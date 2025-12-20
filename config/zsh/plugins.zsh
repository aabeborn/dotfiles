# ✨ plugins.zsh
# Fast, minimal shell UX enhancements.
# Loaded last. No magic. 😌

# --------------------------------------------------
# 💡 Autosuggestions
# --------------------------------------------------
# Suggests commands as you type.
# Non-blocking, async, fast.

if [[ -r /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
  source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fi


# --------------------------------------------------
# ⌨️ Completion tuning (native Zsh)
# --------------------------------------------------

# Cache completions aggressively
ZSH_COMPDUMP="$HOME/.zcompdump"

autoload -Uz compinit
compinit -d "$ZSH_COMPDUMP"

# Do not complete slow things
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$HOME/.zcompcache"
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# Skip expensive checks
zstyle ':completion:*:git:*' script ~/.zsh/git-completion.bash 2>/dev/null


# --------------------------------------------------
# 📦 Extra completions (zsh-completions)
# --------------------------------------------------

if command -v brew >/dev/null 2>&1; then
  FPATH="$(brew --prefix)/share/zsh-completions:$FPATH"
fi
