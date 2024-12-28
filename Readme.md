# My personal pc configuration

This is my personal pc configuration. It is based on nixos and uses flakes.
**Important!** This configuration works only on darwin systems.(MacOS) with Apple Silicon chips.

## Features

- Base MacOS configuration (in a declarative way🤩) via `nix-darwin`.
- Homebrew installation, with all the packages I need, like UI Applications, CLI tools and fonts.
- Home-manager configuration to setup all needed dotfiles.

## Installation

1. Clone this repository on your $HOME directory.
2. Install nix via the following command:

```sh
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
```

3. Install nix-darwin via the following command:

```sh
nix run nix-darwin -- switch --flake ~/dotfiles
darwin-rebuild switch --flake ~/dotfiles
```

## Usage

To rebuild the configuration run the following command:

```sh
flakeb
```

To update the flake inputs

```sh
flakeu
```

## Apps and packages available

### Development Apps

- Terminal:
  - [Wezterm](https://wezfurlong.org/wezterm)
  - [Warp](https://warp.dev)
  - [Ghostty](https://ghostty.org) **Default Choice**
- IDE:
  - [Neovim](https://neovim.io)
  - [VSCode](https://code.visualstudio.com)
  - [Zed](https://zed.dev) **Default Choice**
- Shell: [zsh](https://www.zsh.org)
- Containers Development: [Podman](https://podman.io)
- Figma Desktop: [Figma](https://www.figma.com)

### CLI Tools

- [Starship](https://starship.rs): A minimal, blazing-fast, and infinitely customizable prompt for any shell.
- [Zoxide](https://github.com/ajeetdsouza/zoxide): A faster way to navigate your filesystem (cd replacement).
- [Bat](http://github.com/sharkdp/bat): A cat(1) clone with wings.
- [Ripgrep](https://github.com/BurntSushi/ripgrep): A search tool that recursively searches the current directory for a regex pattern..
- [Eza](https://github.com/eza-community/eza): A modern replacement for ls.
- [Tmux](https://github.com/tmux/tmux/wiki): A terminal multiplexer.
- [GitUI](https://github.com/extrawurst/gitui): A terminal UI for git.
- [Fnm](https://github.com/Schniz/fnm): A NodeJs version manager.
- [Bun](https://bun.sh/): A modern Js runtime.
- [Zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions): Fish-like autosuggestions for zsh.
- [Gitmoji](https://gitmoji.dev/): An emoji guide for your commit messages.
- [Pnpm](https://pnpm.io/): A fast, disk space efficient package manager.

### Fonts (All via nerd-fonts)

- [Fira Code](https://github.com/tonsky/FiraCode)
- [JetBrains Mono](https://www.jetbrains.com/lp/mono)
- [Geist](https://https://vercel.com/font)

### Mac utilities

- [Sketchybar](https://github.com/FelixKratz/SketchyBar): A status bar for MacOS.
- [AltTab](https://alt-tab-macos.netlify.app/): A window switcher for MacOS.
- [Raycast](https://www.raycast.com/): A command launcher for MacOS.
- [Mas](https://github.com/mas-cli/mas): A CLI for the Mac App Store.
- [Rectangle](https://rectangleapp.com/): A window manager for MacOS.

### UI Apps

- [Brave](https://brave.com): A privacy-focused browser.
- [Arc](https://arc.net): A chrome based browser.
- [Zen](https://zen-browser.app/welcome): Firefox based browser.
- [Spotify](https://www.spotify.com): A music streaming service.
- [Telegram](https://telegram.org): A messaging app.
- [Whatsapp](https://whatsapp.com): A messaging app.
- [Discord](https://discord.com): A messaging app.
- [Notion](https://www.notion.so): A note-taking app.
- [Amazon Photos](https://www.amazon.com/photos): A photo storage app.
- [RunCat](https://apps.apple.com/us/app/runcat/id1429033973?mt=12): A cute cat that runs on your desktop.
- [Dashlane](https://www.dashlane.com): A password manager.
- [Flow](https://flowapp.info): A Focus application.

## Next Steps

- [ ] Define and map keybindings
- [ ] make it available for intel Macs
- [ ] Make it available for WLS2 and Linux (without homebrew casks)
- [ ] Get the user and home path from the system
- [ ] Configure sketchybar
- [ ] Configure neovim
- [ ] Configure tmux
- [ ] Add ghostty
- [ ] Configure vscode

## Tools to try

- [ ] [Ddgr](https://github.com/jarun/ddgr): DuckDuckGo from the terminal.
- [ ] [Fz](https://github.com/mrjohannchang/fz.sh): A plugin that seamlessly adds fuzzy search to tab completion.
- [ ] [Aerospace](https://github.com/nikitabobko/AeroSpace): A window manager for MacOS.
