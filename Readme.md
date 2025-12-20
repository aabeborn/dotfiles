🧰 Dotfiles

Minimal, opinionated dotfiles.

(Imagine the chill guy meme here, vibing quietly while nothing breaks.)

This repository is intentionally small and boring.
It provides a clean base to bootstrap a new machine, and nothing more.

--------------------------------------------------

🎯 Goals

- Fast setup on a new machine
- Predictable behavior
- Easy to extend over time

Anything that adds complexity must earn its place.

(If future-me is reading this: yes, you were right to keep it simple.)

--------------------------------------------------

✅ What this repo does

- Detects the operating system
- Symlinks a small set of core config files
- Provides a safe base to add tools later

That’s it.

(No fireworks. No wizardry. Just calm, predictable vibes.)

--------------------------------------------------

🗂 Repository structure

dotfiles/
  bootstrap/        setup scripts
  config/           versioned app configs
  shell/            zsh configuration
  Makefile
  README.md

--------------------------------------------------

🚀 Installation

git clone https://github.com/aabeborn/dotfiles.git
cd dotfiles
make install

You can re-run the install safely.
Existing files are never overwritten.

(This script has the emotional range of a house plant.)

--------------------------------------------------

👻 Ghostty theme sync (macOS)

On macOS, this repo optionally syncs Ghostty’s theme
(light / dark) with the system appearance.

How it works:

- Ghostty config lives in the dotfiles repo
- A small script updates the theme
- A launchd agent listens for macOS appearance changes
- Ghostty reloads instantly

What gets installed on macOS:

- A symlinked launchd plist at:
  ~/Library/LaunchAgents/com.aabeborn.ghostty.theme.plist
- The agent is loaded automatically during install

Source of truth:

config/ghostty/ghostty-theme.plist

Manual control:

Unload:
launchctl bootout gui/$(id -u) com.aabeborn.ghostty.theme

Load:
launchctl bootstrap gui/$(id -u) ~/Library/LaunchAgents/com.aabeborn.ghostty.theme.plist

This setup is:
- event-driven
- reversible
- macOS-native
- fully managed via dotfiles

--------------------------------------------------

🧩 Customization

This is a base.

Tools, plugins, and OS-specific tweaks are added
incrementally and intentionally.

If something becomes unnecessary, it will be removed.

(Configs are temporary. Peace of mind is forever.)

--------------------------------------------------

🚫 Non-goals

- Supporting every tool or workflow
- Heavy abstractions
- Magic installers

--------------------------------------------------

✨ Simple first. Everything else comes later.
