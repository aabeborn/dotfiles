# 🧰 tools.zsh
# External tools only.
# No aliases. No prompt logic. No secrets.
# Calm glue between Zsh and your system 😌

# --------------------------------------------------
# 🍺 Homebrew
# --------------------------------------------------
# Base package manager (macOS / Linux / WSL)
# Must be fast, quiet, and predictable.

if command -v brew >/dev/null 2>&1; then
  eval "$(brew shellenv)"
fi


# --------------------------------------------------
# 🧭 Navigation — zoxide
# --------------------------------------------------
# Smarter `cd`, zero cognitive load.
# Learns as you move.

if command -v zoxide >/dev/null 2>&1; then
  eval "$(zoxide init zsh)"
fi


# --------------------------------------------------
# 🟢 Node.js — fnm
# --------------------------------------------------
# Fast Node version manager.
# Activates per-project on `cd`.

if command -v fnm >/dev/null 2>&1; then
  eval "$(fnm env --use-on-cd --shell zsh)"
fi

# --------------------------------------------------
# 📦 Corepack (pnpm / yarn)
# --------------------------------------------------
# Ensures package managers are versioned per project.

if command -v corepack >/dev/null 2>&1; then
  corepack enable >/dev/null 2>&1
fi

# --------------------------------------------------
# 🩺 Node sanity check (non-blocking)
# --------------------------------------------------
# Warn only if pnpm is global and Corepack is expected

node_sanity_check() {
  # only run in interactive shells
  [[ -o interactive ]] || return

  # only check inside JS projects
  [[ -f package.json ]] || return

  # project declares a package manager
  grep -q '"packageManager"' package.json 2>/dev/null || return

  # pnpm should be provided by Corepack
  if command -v pnpm >/dev/null 2>&1; then
    local pnpm_path
    pnpm_path="$(command -v pnpm)"

    if [[ "$pnpm_path" != *"corepack"* ]]; then
      print -P "%F{yellow}⚠ pnpm is not managed by Corepack (%f$pnpm_path%F{yellow})%f"
      print -P "%F{yellow}  → consider removing global pnpm%f"
    fi
  fi
}


# --------------------------------------------------
# ✍️ Editors
# --------------------------------------------------
# Keep it boring. Tools can override locally.

export EDITOR=vim
export VISUAL=vim

# Sync Ghostty theme with macOS appearance
~/.config/ghostty/sync-theme.sh ensure-cron >/dev/null 2>&1 &!

autoload -Uz add-zsh-hook
add-zsh-hook chpwd node_sanity_check

# --------------------------------------------------
# 🧱 End of tools
# --------------------------------------------------
# If it:
# - mutates PATH aggressively
# - hooks into the prompt
# - needs secrets
# → it does NOT belong here.
