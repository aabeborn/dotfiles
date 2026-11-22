# 🧰 tools.zsh — external tools. Each block is a silent no-op when the tool is missing.

# 🧭 zoxide — replaces cd. `cd <partial>` jumps to the best match; `cd -` still works.
if command -v zoxide >/dev/null 2>&1; then
  eval "$(zoxide init zsh --cmd cd)"
fi

# 🔎 fzf — replaces the default Ctrl-R (history), Ctrl-T (files), Alt-C (cd)
if command -v fzf >/dev/null 2>&1; then
  source <(fzf --zsh)
fi

# 🎨 eza (ls) — Rose Pine, the same palette as the prompt (Moon in dark mode, Dawn in light).
# Keys: di directories, ln symlinks, ex executables, da dates, sn sizes, uu user,
# ur/uw/ux and gr/gw/gx and tr/tw/tx permission bits (read iris, write rose, execute pine).
if [[ "$(defaults read -g AppleInterfaceStyle 2>/dev/null)" == "Dark" ]]; then
  export EZA_COLORS="di=1;38;5;30:ln=38;5;152:ex=1;38;5;217:da=38;5;102:sn=38;5;183:uu=38;5;217:gu=38;5;217:ur=38;5;183:uw=38;5;217:ux=38;5;30:gr=38;5;183:gw=38;5;217:gx=38;5;30:tr=38;5;183:tw=38;5;217:tx=38;5;30"
else
  export EZA_COLORS="di=1;38;5;24:ln=38;5;67:ex=1;38;5;174:da=38;5;102:sn=38;5;103:uu=38;5;174:gu=38;5;174:ur=38;5;103:uw=38;5;174:ux=38;5;24:gr=38;5;103:gw=38;5;174:gx=38;5;24:tr=38;5;103:tw=38;5;174:tx=38;5;24"
fi

# 📦 pnpm — manages Node too (`pnpm runtime set node <version> -g`).
# Global bin is $PNPM_HOME/bin. pnpm creates it on first global install and refuses
# global installs while it is missing from PATH, so it is added unconditionally.
export PNPM_HOME="$HOME/Library/pnpm"
path=("$PNPM_HOME/bin" $path)

# 🥟 Bun — bun and bunx, plus globals installed with `bun add -g`
path=("$HOME/.bun/bin" $path)
