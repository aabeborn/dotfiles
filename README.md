# 🧰 Dotfiles (v3)

Small, macOS-only dotfiles. Configs are symlinked from this repo into `$HOME`, so editing a file here edits the live config.

## Layout

```
scripts/
  install.sh   brew bundle, then link
  link.sh      symlink manager: install | cleanup | status
config/
  zsh/         zshenv, zshrc, and layers loaded by zshrc
  git/config   git behaviour (identity lives in ~/.gitconfig)
Brewfile       every package the configs rely on
Makefile       install, dry-run, bundle, status, cleanup, check
```

## Install

```sh
make dry-run   # show what would happen
make install   # brew bundle, bun globals, then link
```

## Update

```sh
make update    # or the alias: dotup
```

Updates Homebrew (formulae and casks you don't pin), the global bun packages in `scripts/bun-globals.txt`, and the global Node to the newest LTS via pnpm.

## Git identity (two profiles)

Identity is not in the repo. Create these files once per machine, in `~/.config/git-local/`:

- `personal.gitconfig`: the default `[user]` name and email.
- `work.gitconfig`: the work `[user]` name and email.
- `identity.gitconfig`: includes the personal file, then maps your work folder to the work file with `includeIf "gitdir:<work-folder>/"`.

`config/git/config` includes `identity.gitconfig`. Check with `git config user.email` inside a repo.

## Links

- `make status` shows the state of each link. The map lives in `scripts/link.sh`.
- Real files are never overwritten. They are reported as conflicts; move them aside and re-run.
- Symlinks into this repo are refreshed automatically (for example after moving the repo).
- `make cleanup` removes only links that point into this repo.

## Zsh load order

`zshenv` (every shell): Homebrew environment and Homebrew settings. `zshrc`: PATH, history, environment, completion, Pure prompt, `tools.zsh` (zoxide, fzf, pnpm, bun PATH), `aliases.zsh`, `~/.zshrc.local` (machine-specific, not versioned), then `plugins.zsh` last.

## Checks

```sh
make check   # bash and zsh syntax, shellcheck when installed
```

## Principles

- Behaviour only in the repo. No identity, secrets, or tokens.
- Anything that mutates `PATH` aggressively, hooks the prompt, or needs secrets does not belong here.
- Keep it small. Add a tool only when it earns its place.
