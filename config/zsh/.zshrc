# Env Variables
export DOTFILES="$HOME/dev/dotfiles"
export TMUX_CONFIG_HOME="$HOME/.config/tmux/tmux.conf"
export GIT_CONFIG="$HOME/.config/git/config"
# Shell aliases
alias shell-reload='source ~/.zshrc'
alias shell-restart='exec zsh -l'

# Bat aliases
alias cat='bat'                 # Replace standard cat with bat
alias batf='bat --file-name'    # Specify filename for syntax highlighting
alias batn='bat -n'             # Show line numbers
alias batl='bat -l'             # Explicitly set language
alias batd='bat --diff'         # Show diff highlighting
alias batdg='bat --diff-so-fancy'  # Fancy diff output

# Eza aliases
alias ls='eza'
alias ll='eza -l'               # List files with long format
alias la='eza -la'              # List all files long format
alias lt='eza --tree'           # Tree view
alias ltl='eza --tree --level'  # Tree view with specified depth
alias lsr='eza -lR'             # Recursive listing
alias lss='eza -lhHS'           # Sort by size
alias lsn='eza -lhHN'           # Sort by name
alias lsm='eza -lhHt'           # Sort by modification time
alias lsda='eza -lD'            # List only directories
alias lsfa='eza -lf'            # List only files
alias lg='eza -lbGF --git'      # Long format with Git status
alias lgg='eza -lbGF --git --git-ignore'  # Ignore Git-ignored files

# Git aliases
alias gui='lazygit'

# Basic Commands
alias g='git'
alias ga='git add -p'
alias gaa='git add --all -p'

# Commit Commands
alias gc='gitmoji -c'
alias gca='gaa && gc'  # Commit with all changes

# Branch Commands
alias gb='git branch'
alias gba='git branch -a'  # List all branches
alias gbd='git branch -d'  # Delete branch
alias gbdd='git branch -D'  # Force delete branch

# Checkout Commands
alias gco='git checkout'
alias gcob='git checkout -b'  # Create and switch to new branch
alias gcom='git checkout main'
alias gcod='git checkout develop'

# Diff and Status
alias gd='git diff'
alias gds='git diff --staged'
alias gs='git status -sb'  # Short status with branch info

# Pulling and Fetching
alias gf='git fetch'
alias gpl='git pull'
alias gplr='git pull --rebase'

# Pushing
alias gp='git push'
alias gpf='git push --force'
alias gpsu='git push --set-upstream origin $(git branch --show-current)'

# Logs and History
alias gl='git log --oneline --decorate'
alias gla='git log --oneline --decorate --graph --all'
alias glp='git log -p'  # Log with patch (detailed changes)

# Stash Commands
alias gst='git stash'
alias gstp='git stash pop'
alias gstl='git stash list'

# Merge and Rebase
alias gm='git merge'
alias grb='git rebase'
alias grba='git rebase --abort'
alias grbc='git rebase --continue'

# Advanced Workflow
alias greset='git reset'
alias greseth='git reset --hard'
alias gresetsoft='git reset --soft'

# Remote Operations
alias gr='git remote'
alias grv='git remote -v'

# Cleanup
alias gclean='git clean -fd'  # Remove untracked files and directories

# Utility
alias gignore='git update-index --assume-unchanged'
alias gunignore='git update-index --no-assume-unchanged'

# PNPM Aliases
alias pn='pnpm'
alias pni='pnpm install'
alias pnu='pnpm update'
alias pnr='pnpm run'
alias pnt='pnpm test'
alias pnx='pnpm exec'
alias pna='pnpm add'
alias pnad='pnpm add --dev'
alias pnui='pnpm upgrade-interactive --latest'
alias pnc="rm -rf node_modules && pnpm install"
alias pncf="rm -rf node_modules && rm pnpm.lock && pnpm install"
alias audit='pnpm audit'
alias lint='pnpm lint'
alias format='pnpm format'

# Node Version Management (FNM)
alias fn='fnm'
alias fni='fnm install'
alias fnu='fnm use'
alias fnl='fnm list'
alias fnls='fnm list-remote'

# Docker Aliases
#
# Container Management
alias d='podman'
alias da='podman attach'
alias dls='podman ps'
alias dlsa='podman ps -a'
alias dimg='podman images'
alias drm='podman rm'
alias drmi='podman rmi'

# Container Run and Exec
alias drun='podman run'
alias drund='podman run -d'
alias dexec='podman exec -it'
alias dstart='podman start'
alias dstop='podman stop'
alias drestart='podman restart'

# Build and Compose
alias dbuild='podman build'
alias dcomp='podman-compose'
alias dcompup='podman-compose up'
alias dcompdown='podman-compose down'

# Network and Volume
alias dnet='podman network'
alias dvol='podman volume'
alias dnetls='podman network ls'
alias dvoll='podman volume ls'

# Advanced Container Operations
alias dlogs='podman logs'
alias dinspect='podman inspect'
alias dtop='podman top'
alias dstats='podman stats'

# Clean and Prune
alias dprune='podman system prune -a'
alias drmunused='podman image prune'
alias drmcontainers='podman container prune'

# Search and Pull
alias dpull='podman pull'
alias dsearch='podman search'

## a quick way to get out of current directory ##
alias ..='cd ..'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias .....='cd ../../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../..'

# Other aliases
alias ide="zed ."
alias v="nvim ."

# Tmux aliases
# Start a new tmux session
alias tn='tmux new -s'
# List existing tmux sessions
alias tl='tmux list-sessions'
# Attach to the most recent tmux session
alias ta='tmux attach'
# Attach to a specific tmux session
alias tas='tmux attach -t'
# Kill a specific tmux session
alias tk='tmux kill-session -t'
# Detach from current tmux session
alias td='tmux detach'
# Switch between tmux panes (example using vim-like navigation)
alias tp='tmux select-pane'
# Split pane horizontally
alias tph='tmux split-window -h'
# Split pane vertically
alias tpv='tmux split-window -v'
# Reload tmux configuration
alias tr='tmux source-file ~/.tmux.conf'
# Create a new window
alias tw='tmux new-window'
# Kill current window
alias tkw='tmux kill-window'
# List key bindings
alias tkb='tmux list-keys'

eval "$(zoxide init zsh)"
eval "$(starship init zsh)"

# Initialize zsh autosuggestion
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
# Initialize szh completion
FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
autoload -Uz compinit
compinit
# Initialize zsh syntax highlighting
source $HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Automatically start tmux if not already inside a tmux session
if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
  tmux
fi
