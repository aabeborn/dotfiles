# ✨ pure.zsh — Pure prompt in Rose Pine colours (Dawn in light mode, Moon in dark).
# Installed by Homebrew; its site-functions are on fpath via brew shellenv.
#
# Pure reads colours from zstyle ":prompt:pure:<key>" color, not from PURE_*_COLOR
# variables. Those variables do nothing, so this file sets the zstyles instead.
# The palette is 256-colour approximations of the Rose Pine hex values.

autoload -Uz promptinit
promptinit

# 🎨 Palette. Dark: Rose Pine Moon. Light: Rose Pine Dawn.
if [[ "$(defaults read -g AppleInterfaceStyle 2>/dev/null)" == "Dark" ]]; then
  rp_rose=217   rp_love=204   rp_pine=30   rp_foam=152   rp_iris=183   rp_gold=216   rp_muted=102
else
  rp_rose=174   rp_love=132   rp_pine=24   rp_foam=67    rp_iris=103   rp_gold=130   rp_muted=102
fi

zstyle ':prompt:pure:prompt:success'      color $rp_rose
zstyle ':prompt:pure:prompt:error'        color $rp_love
zstyle ':prompt:pure:prompt:continuation' color $rp_muted
zstyle ':prompt:pure:path'                color $rp_pine
zstyle ':prompt:pure:git:branch'          color $rp_iris
zstyle ':prompt:pure:git:dirty'           color $rp_love
zstyle ':prompt:pure:git:stash'           color $rp_foam
zstyle ':prompt:pure:git:action'          color $rp_gold
zstyle ':prompt:pure:host'                color $rp_muted
zstyle ':prompt:pure:user'                color $rp_muted
zstyle ':prompt:pure:execution_time'      color $rp_gold
zstyle ':prompt:pure:node_version'        color $rp_foam

PURE_PROMPT_SYMBOL='▸'
PURE_PROMPT_VICMD_SYMBOL='◂'
PURE_SHOW_EXIT_CODE=1

# 🔗 Git status: fast and async
PURE_GIT_PULL=0
PURE_GIT_UNTRACKED_DIRTY=0
PURE_GIT_DELAY_DIRTY_CHECK=1800
PURE_GIT_STASH=1
PURE_GIT_DIRTY_SYMBOL='✚'
PURE_GIT_CLEAN_SYMBOL='✔'

prompt pure
