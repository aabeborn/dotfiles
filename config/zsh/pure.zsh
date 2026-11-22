# ✨ pure.zsh — Pure prompt, Rose Pine colours.
# Installed by Homebrew; its site-functions are on fpath via brew shellenv.

autoload -Uz promptinit
promptinit

PURE_PROMPT_SYMBOL='▸'
PURE_PROMPT_VICMD_SYMBOL='◂'
PURE_SHOW_EXIT_CODE=1

PURE_PROMPT_COLOR='rose'
PURE_PATH_COLOR='pine'
PURE_GIT_BRANCH_COLOR='iris'
PURE_GIT_DIRTY_COLOR='love'
PURE_GIT_CLEAN_COLOR='foam'

# 🔗 Git status: fast and async
PURE_GIT_PULL=0
PURE_GIT_UNTRACKED_DIRTY=0
PURE_GIT_DELAY_DIRTY_CHECK=1800
PURE_GIT_STASH=1
PURE_GIT_DIRTY_SYMBOL='✚'
PURE_GIT_CLEAN_SYMBOL='✔'

prompt pure
