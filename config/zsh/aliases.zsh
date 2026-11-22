# 🧠 aliases.zsh — short names for things typed often.
# Only aliases that change something. Tools keep their own names.

# 🔍 Search — the modern tools take over the classic names
alias grep='rg'               # ripgrep. Its flags differ from grep's for some options.
alias find='fd'               # fd. Syntax differs from find's (`fd PATTERN`, not `find -name`).
alias rgi='rg -i'
alias rgh='rg --hidden'
alias fda='fd -HI'
alias fdd='fd -t d'
alias fh='fzf --height 40% --reverse'
alias ff='fzf --preview "head -n 200 {}"'

# 🧭 Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias c='clear'
alias nf='touch'
alias nd='mkdir -p'

# 📁 Listing
alias ls='eza'
alias ll='eza -l'
alias la='eza -la'
alias lt='eza --tree'

# 📄 Viewing — files open in Zed, not the terminal
alias zf='fzf --preview "head -n 200 {}" | xargs -r zed'   # pick a file, open it in Zed

# 🌱 Git
alias g='git'
alias gs='git status -sb'
alias gl='git log --oneline --decorate --graph'
alias gd='git diff'
alias gds='git diff --staged'
alias ga='git add'
alias gaa='git add --all'
alias gap='git add -p'
alias gc='git commit'
alias gca='git commit --amend'
alias gcan='git commit --amend --no-edit'
alias gp='git push'
alias gpf='git push --force-with-lease'
alias gpl='git pull'
alias gb='git branch'
alias gco='git checkout'
alias gcob='git checkout -b'
alias gst='git stash'
alias gstp='git stash pop'
alias gstl='git stash list'

# Rebase onto origin's default branch (main / master / whatever).
git_default_branch() {
  git symbolic-ref refs/remotes/origin/HEAD 2>/dev/null \
    | sed 's@^refs/remotes/origin/@@'
}
alias grbd='git fetch origin && git rebase origin/$(git_default_branch)'
alias grbc='git rebase --continue'
alias grba='git rebase --abort'

# 🔄 Update the whole setup: brew, bun globals, latest LTS Node (scripts/update.sh)
alias dotup='make -C "$(dirname "$(dirname "$(readlink ~/.config/zsh)")")" update'

# 🍺 Homebrew
alias bup='brew update && brew upgrade && brew cleanup'   # brew only
alias bdoc='brew doctor'
alias bbun='brew bundle --file "$(dirname "$(dirname "$(readlink ~/.config/zsh)")")/Brewfile"'   # sync from the repo's Brewfile

# 📦 pnpm
alias pi='pnpm install'
alias pa='pnpm add'
alias pr='pnpm run'

# 🧑‍💻 Editor and GitHub
alias ze='zed .'            # open the current folder in Zed
alias gpr='gh pr create'
alias gprv='gh pr view --web'

# 🔄 Shell
# Replace this shell with a fresh login shell (re-reads .zprofile and .zshrc).
alias restart='exec zsh -l'
