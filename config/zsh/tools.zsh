# 🧰 tools.zsh — external tools. Each block is a silent no-op when the tool is missing.

# 🧭 zoxide — replaces cd. `cd <partial>` jumps to the best match; `cd -` still works.
if command -v zoxide >/dev/null 2>&1; then
  eval "$(zoxide init zsh --cmd cd)"
fi

# 🔎 fzf — replaces the default Ctrl-R (history), Ctrl-T (files), Alt-C (cd)
if command -v fzf >/dev/null 2>&1; then
  source <(fzf --zsh)
fi

# 📦 pnpm — manages Node too (`pnpm runtime set node <version> -g`).
# Global bin is $PNPM_HOME/bin. pnpm creates it on first global install and refuses
# global installs while it is missing from PATH, so it is added unconditionally.
export PNPM_HOME="$HOME/Library/pnpm"
path=("$PNPM_HOME/bin" $path)

# 🥟 Bun — bun and bunx, plus globals installed with `bun add -g`
path=("$HOME/.bun/bin" $path)
