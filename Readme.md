# 🧰 Dotfiles

Minimal, opinionated dotfiles.

_(Imagine the chill guy meme here, vibing quietly while nothing breaks.)_

This repository is intentionally small and boring.
It provides a clean base to bootstrap a new machine, and nothing more.

---

## 🎯 Goals

- Fast setup on a new machine
- Predictable behavior
- Easy to extend over time

Anything that adds complexity must earn its place.

_(If future-me is reading this: yes, you were right to keep it simple.)_

---

## ✅ What this repo does

- Detects the operating system
- Symlinks a small set of core config files
- Provides a safe base to add tools later

That’s it.

_(No fireworks. No wizardry. Just calm, predictable vibes.)_

---

## 🗂 Repository structure

```text
dotfiles/
├── bootstrap/   # setup scripts
├── shell/       # shell configuration
├── git/         # git config
├── Makefile
└── README.md
```

---

## 🚀 Installation

```bash
git clone https://github.com/aabeborn/dotfiles.git
cd dotfiles
make install
```

You can re-run the install safely.

_(This script has the emotional range of a house plant. It will not surprise you.)_
Existing files are never overwritten.

---

## 🧩 Customization

This is a base.

Tools, plugins, and OS-specific tweaks will be added incrementally and intentionally.

If something becomes unnecessary, it will be removed.

_(Configs are temporary. Peace of mind is forever.)_

---

## 🚫 Non-goals

- Supporting every tool or workflow
- Heavy abstractions
- Magic installers

---

> ✨ Simple first. Everything else comes later.
