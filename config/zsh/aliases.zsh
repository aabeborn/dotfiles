# 🎯 aliases.zsh
# High-signal aliases only.
# Muscle memory > cleverness.
# Calm. Explicit. Boring. 😌
#
# Yes, many of these exist because I am lazy.
# No, I will not apologize.

# --------------------------------------------------
# 🐚 Shell lifecycle
# --------------------------------------------------

alias reload='source ~/.zshrc'
alias restart='exec zsh -l'
alias c='clear'


# --------------------------------------------------
# 📁 Navigation
# --------------------------------------------------

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# zoxide (do NOT override cd)
alias z='z'
alias zz='z -'


# --------------------------------------------------
# 📂 Listing (eza)
# --------------------------------------------------

alias ls='eza'
alias ll='eza -l'
alias la='eza -la'
alias lt='eza --tree'


# --------------------------------------------------
# 📖 Viewing files (bat)
# --------------------------------------------------

alias cat='bat'
alias batn='bat -n'
alias batd='bat --diff'


# --------------------------------------------------
# 🌿 Git — core
# --------------------------------------------------

alias g='git'
alias gs='git status -sb'
alias gd='git diff'
alias gds='git diff --staged'
alias gl='git log --oneline --decorate --graph'

# Fetch / sync
alias gf='git fetch'
alias gfa='git fetch --all --prune'
alias gpr='git pull --rebase'
alias gpsup='git push --set-upstream origin HEAD'

# Commit
alias gc='git commit'
alias gcm='git commit -m'
alias gca='git commit --amend --no-edit'
alias gcan='git commit --amend'

# Rebase
alias grb='git rebase'
alias grbi='git rebase -i'
alias grbc='git rebase --continue'
alias grba='git rebase --abort'
alias grbs='git rebase --skip'

# Undo / restore
alias grh='git reset --hard'
alias grs='git restore --staged'
alias gru='git restore .'

# Inspect
alias gsh='git show'
alias gsha='git show --stat'
alias gshn='git show --name-only'

# Branches
alias gb='git branch'
alias gba='git branch -a'
alias gbd='git branch -d'
alias gbD='git branch -D'

# Stash
alias gst='git stash'
alias gstp='git stash pop'
alias gstl='git stash list'

# Git UI
alias lg='lazygit'


# --------------------------------------------------
# 🧠 Git helpers (functions)
# --------------------------------------------------

# Rebase current branch onto the default remote branch
# (origin/HEAD → main, master, etc.)
grbd() {
  # Fail if working tree is dirty
  if ! git diff --quiet || ! git diff --cached --quiet; then
    echo "❌ Working tree not clean"
    return 1
  fi

  local base
  base=$(git symbolic-ref --quiet --short refs/remotes/origin/HEAD 2>/dev/null | sed 's@^origin/@@')

  if [[ -z "$base" ]]; then
    echo "❌ Could not determine default branch"
    return 1
  fi

  git fetch origin "$base" && git rebase "origin/$base"
}


# --------------------------------------------------
# 📦 Node / JS
# --------------------------------------------------

alias pn='pnpm'
alias pni='pnpm install'
alias pnr='pnpm run'
alias pnt='pnpm test'
alias pnb='pnpm build'
alias pnd='pnpm dev'


# --------------------------------------------------
# 🔍 Search & data
# --------------------------------------------------

alias f='fd'
alias r='rg'
alias j='jq'
alias grep='rg'
alias find='fd'


# --------------------------------------------------
# 📁 Filesystem helpers
# --------------------------------------------------

alias mkdirp='mkdir -p'
alias rmf='rm -rf'

# Create a new file (and parent dirs if needed)
# Usage: new path/to/file.txt
new() {
  if [[ -z "$1" ]]; then
    echo "Usage: new path/to/file"
    return 1
  fi

  mkdir -p "$(dirname "$1")" && touch "$1"
}


# --------------------------------------------------
# 🧪 Dev helpers
# --------------------------------------------------

alias ports='lsof -i -P -n'
alias serve='python3 -m http.server'


# --------------------------------------------------
# 🧾 just
# --------------------------------------------------

alias jst='just'


# --------------------------------------------------
# 🖥️ Tmux
# --------------------------------------------------

alias t='tmux'
alias tn='tmux new -s'
alias ta='tmux attach'
alias tl='tmux ls'
alias tk='tmux kill-session -t'


# --------------------------------------------------
# 🧘 End
# --------------------------------------------------
# If an alias needs explanation:
# it does not belong here.
