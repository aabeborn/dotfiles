# 🧰 Dotfiles

Minimal, opinionated dotfiles.

_(Imagine the chill guy meme here, vibing quietly while nothing breaks.)_

This repository is intentionally small, calm, and boring.
It provides a clean, predictable base to bootstrap a new machine,
and resists the urge to become a personality.

---

## 🎯 Goals

- Fast setup on a new machine
- Predictable, idempotent behavior
- Easy to extend over time
- Zero magic, zero surprises

Anything that adds complexity must earn its place.

_(If future-me is reading this: yes, you were right to keep it simple.)_

---

## ✅ What this repo does

- Detects the operating system
- Symlinks a small, explicit set of config files
- Sets up a fast Zsh environment with a clean prompt
- Establishes a modern Node.js toolchain
- Provides a stable base to add tools later

That’s it.

_(No fireworks. No wizardry. Just calm, predictable vibes.)_

---

## 🐚 Shell setup

### Zsh (layered, minimal)

Zsh configuration lives under:

~/.config/zsh/

A very small ~/.zshrc acts only as an orchestrator.

Configuration is split intentionally:

- zshrc — wiring only
- prompt.pure.zsh — prompt logic
- tools.zsh — external tools
- aliases.zsh — shortcuts (kept minimal)
- plugins.zsh — optional UX plugins

---

### ✨ Prompt — Pure

- Pure prompt (installed via Homebrew)
- Async Git (no lag, even in large repositories)
- Japandi-style symbols
- Rose Pine–inspired colors (light / dark adaptive)
- Contextual runtime info (Node / Go only when relevant)

Fast, readable, and intentionally understated.

_(If a prompt ever slows the shell, it doesn’t belong here.)_

---

## 🟢 Node.js toolchain

Modern, reproducible, and boring (in a good way):

- fnm — Node version manager
  - default: latest
  - auto-switch on cd
- Corepack — package manager versions
  - pnpm / yarn resolved per project
  - driven by packageManager in package.json
- No global pnpm installs
- Sanity checks warn only when something is misconfigured

_(Projects declare their needs. The shell stays quiet.)_

---

## 🧰 Core CLI tools

A small, high-leverage set of tools used daily:

- fzf — interactive fuzzy search
- fd — modern find
- ripgrep (rg) — fast text search
- bat — better cat
- delta — readable git diffs
- gh — GitHub CLI
- lazygit — Git TUI
- just — human-friendly command runner
- jq — JSON processing

All tools are installed via Homebrew.
The shell integrates only what’s necessary.

---

## 🔗 Symlink system

Dotfiles are managed via a custom symlink script:

- install and cleanup modes
- idempotent (safe to re-run)
- dry-run support
- never overwrites real files
- fully reversible

_(This script has the emotional range of a house plant.)_

---

## 🗂 Repository structure

dotfiles/
├── bootstrap/   # setup & symlink scripts
├── shell/       # zsh configuration
├── config/      # app configs (git, etc.)
├── Makefile
└── README.md

Everything mirrors ~/.config where possible.

---

## 🚀 Installation

git clone https://github.com/aabeborn/dotfiles.git
cd dotfiles
make install

You can re-run the install safely at any time.
Existing files are never overwritten.

---

## 🧩 Customization

This is a base, not a framework.

Tools, plugins, and OS-specific tweaks are added
incrementally and intentionally.

If something becomes unnecessary, it will be removed.

_(Configs are temporary. Peace of mind is forever.)_

---

## 🚫 Non-goals

- Supporting every tool or workflow
- Heavy abstractions
- Plugin managers
- Magic installers
- Cleverness for its own sake

---

✨ Simple first. Everything else comes later.
