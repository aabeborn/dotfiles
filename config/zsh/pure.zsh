#  ✨ Pure prompt — Catppuccin adaptive
# Light (day) / Dark (night), fast & calm 😌

if command -v brew >/dev/null 2>&1; then
  FPATH="$(brew --prefix)/share/zsh/site-functions:$FPATH"
fi

autoload -Uz promptinit
promptinit
prompt pure

# --------------------------------------------------
# 🌗 Theme detection (light / dark)
# --------------------------------------------------

is_dark_mode() {
  if [[ "$OSTYPE" == darwin* ]]; then
    [[ "$(defaults read -g AppleInterfaceStyle 2>/dev/null)" == "Dark" ]]
  else
    local hour=$(date +%H)
    (( hour >= 19 || hour < 7 ))
  fi
}

# --------------------------------------------------
# 🎨 Rose Pine (Dawn / Moon)
# --------------------------------------------------

if is_dark_mode; then
  # 🌙 Rose Pine Moon
  PURE_PROMPT_COLOR='rose'
  PURE_PATH_COLOR='pine'
  PURE_GIT_BRANCH_COLOR='iris'
  PURE_GIT_DIRTY_COLOR='love'
  PURE_GIT_CLEAN_COLOR='foam'
else
  # 🌤 Rose Pine Dawn
  PURE_PROMPT_COLOR='rose'
  PURE_PATH_COLOR='pine'
  PURE_GIT_BRANCH_COLOR='iris'
  PURE_GIT_DIRTY_COLOR='love'
  PURE_GIT_CLEAN_COLOR='foam'
fi

# --------------------------------------------------
# 🔗 Git (async, tuned)
# --------------------------------------------------

PURE_GIT_PULL=0
PURE_GIT_UNTRACKED_DIRTY=0
PURE_GIT_DELAY_DIRTY_CHECK=1800
PURE_GIT_STASH=1


PURE_GIT_BRANCH_SYMBOL=''
PURE_GIT_DIRTY_SYMBOL='✚'
PURE_GIT_CLEAN_SYMBOL='✔'

# --------------------------------------------------
# ❯ Prompt symbols
# --------------------------------------------------

PURE_PROMPT_SYMBOL='▸'
PURE_PROMPT_VICMD_SYMBOL='◂'
PURE_SHOW_EXIT_CODE=1

# --------------------------------------------------
# 🧠 Runtime info (Japandi, minimal)
# --------------------------------------------------

pure_runtime_info() {
  local info=()

  # Node → only in JS projects
  if command -v node >/dev/null 2>&1 &&
     [[ -f package.json || -f .node-version || -f .nvmrc ]]; then
    info+=("node $(node -v | sed 's/v//')")
  fi

  # Go → only in Go projects
  if command -v go >/dev/null 2>&1 &&
     [[ -f go.mod ]]; then
    info+=("go $(go version | awk '{print $3}' | sed 's/go//')")
  fi

  [[ ${#info[@]} -gt 0 ]] && print -r -- "${(j:  ·  :)info}"
}

# --------------------------------------------------
# 🧩 Inject runtime info above prompt
# --------------------------------------------------

# Preserve original Pure precmd
autoload -Uz prompt_pure_precmd
functions[prompt_pure_precmd_original]=$functions[prompt_pure_precmd]

prompt_pure_precmd() {
  prompt_pure_precmd_original

  local runtime
  runtime="$(pure_runtime_info)"
  [[ -n "$runtime" ]] && print -r -- "$runtime"
}
