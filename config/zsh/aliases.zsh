# --------------------------------------------------
# 🧠 aliases.zsh — tools for people who hate typing
# Muscle memory > cleverness
# Yes, this exists because I am lazy.
# --------------------------------------------------

# --------------------------------------------------
# 🔍 Fuzzy / search tools
# --------------------------------------------------

# fzf
alias f='fzf'
alias fh='fzf --height 40% --reverse'     # history-style
alias ff='fzf --preview "bat --style=numbers --color=always {}"'  # files

# fd (better find)
alias fd='fd'
alias fda='fd -HI'        # include hidden + ignored
alias fdd='fd -t d'       # directories only

# ripgrep (better grep)
alias rg='rg'
alias rgi='rg -i'         # case-insensitive
alias rgh='rg --hidden'  # include hidden files

# --------------------------------------------------
# 🧭 Navigation
# --------------------------------------------------
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

alias z='z'
alias zi='z -i'           # interactive jump
alias zz='z -'            # previous dir

alias c='clear'

# Create things without thinking
alias nf='touch'        # new file
alias nd='mkdir -p'     # new directory

# --------------------------------------------------
# 📁 Modern CLI replacements
# --------------------------------------------------
alias ls='eza'
alias ll='eza -l'
alias la='eza -la'
alias lt='eza --tree'
alias lg='eza -lbGF --git'

alias cat='bat'

# --------------------------------------------------
# 📄 Viewing / diffs
# --------------------------------------------------

# bat (better cat)
alias b='bat'
alias bn='bat -n'
alias bp='bat --plain'

# delta (better git diff)
alias d='delta'
alias ds='delta --side-by-side'

# --------------------------------------------------
# 🌱 Git — calm, explicit, predictable
# --------------------------------------------------

# Base
alias g='git'
alias gs='git status -sb'
alias gl='git log --oneline --decorate --graph'
alias gd='git diff'
alias gds='git diff --staged'

# --------------------------------------------------
# ➕ Add
# --------------------------------------------------
alias ga='git add'
alias gaa='git add --all'
alias gap='git add -p'

# --------------------------------------------------
# ✍️ Commit
# --------------------------------------------------
alias gc='git commit'
alias gcm='git commit -m'
alias gca='git commit --amend'
alias gcan='git commit --amend --no-edit'

# --------------------------------------------------
# 🚀 Push / Pull
# --------------------------------------------------
alias gp='git push'
alias gpf='git push --force-with-lease'
alias gpl='git pull'
alias gplr='git pull --rebase'

# --------------------------------------------------
# 🌿 Branch
# --------------------------------------------------
alias gb='git branch'
alias gba='git branch -a'
alias gbd='git branch -d'
alias gbD='git branch -D'

alias gco='git checkout'
alias gcob='git checkout -b'

# --------------------------------------------------
# 🍒 Cherry-pick
# --------------------------------------------------
alias gcp='git cherry-pick'
alias gcpa='git cherry-pick --abort'
alias gcpc='git cherry-pick --continue'

# --------------------------------------------------
# 🔁 Rebase (default-branch aware)
# --------------------------------------------------

# Resolve default branch (main / master / whatever)
git_default_branch() {
  git symbolic-ref refs/remotes/origin/HEAD 2>/dev/null \
    | sed 's@^refs/remotes/origin/@@'
}

# Fetch + rebase onto default branch
alias grbd='git fetch origin && git rebase origin/$(git_default_branch)'

alias grb='git rebase'
alias grbi='git rebase -i'
alias grbc='git rebase --continue'
alias grba='git rebase --abort'

# --------------------------------------------------
# 🧹 Cleanup / stash
# --------------------------------------------------
alias gclean='git clean -fd'
alias gst='git stash'
alias gstp='git stash pop'
alias gstl='git stash list'

# --------------------------------------------------
# 🧰 Tools
# --------------------------------------------------
alias lg='lazygit'
alias gh='gh'

alias v='nvim'
alias vi='nvim'

# --------------------------------------------------
# 💤 End
# --------------------------------------------------
# If this file grows too much, future-me deletes things.
# That is a promise.
