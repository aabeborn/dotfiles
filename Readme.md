# My personal pc configuration

This is my personal pc configuration. It is based on nixos and uses flakes.
**Important!** This configuration works only on darwin systems.(MacOS) with Apple Silicon chips.

## Features

- Base MacOS configuration (in a declarative way🤩).
- [Homebrew](https://brew.sh/) with all the packages I need, like UI Applications, CLI tools and fonts.
- [Stow](https://www.gnu.org/software/stow/) as dotfile manager

## Installation

1. Clone this repository on your $HOME directory.
2. Add right permissions to files

```sh
chmod 777 ./scripts/*
```

3. Run the setup script

```sh
./scripts/setup.sh
```

## Usage

`setup.sh` is the only and right way to use the repo. it handles different actions:

- `Install`: Setup the pc
- `Uninstall`: Reset all to base configuration
- `Reset Mac Preferences`: Reset to default all properties
- `Refresh dotfiles`: Refresh all dotifles
- `Update`: update all apps

## Apps and packages available

### Development Apps

- Terminal:
  - [Ghostty](https://ghostty.org)
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
- [LazyGit](https://github.com/jesseduffield/lazygit): A terminal UI for git.
- [Fnm](https://github.com/Schniz/fnm): A NodeJs version manager.
- [Bun](https://bun.sh/): A modern Js runtime.
- [Zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions): Fish-like autosuggestions for Zsh.
- [Zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting): Fish shell-like syntax highlighting for Zsh.
- [Zsh-completions](https://github.com/zsh-users/zsh-completion): Additional completion definitions for Zsh.

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

- [Arc](https://arc.net): A chrome based browser.
- [Zen](https://zen-browser.app/welcome): Firefox based browser.
- [Spotify](https://www.spotify.com): A music streaming service.
- [Telegram](https://telegram.org): A messaging app.
- [Whatsapp](https://whatsapp.com): A messaging app.
- [Discord](https://discord.com): A messaging app.
- [Notion](https://www.notion.com): A note-taking app.
- [Notion Calendar](https://www.notion.com/product/calendar): Calendar application.
- [Spark](https://sparkmailapp.com/): Mail client applciation.
- [RunCat](https://apps.apple.com/us/app/runcat/id1429033973?mt=12): A cute cat that runs on your desktop.
- [Dashlane](https://www.dashlane.com): A password manager.
- [Flow](https://flowapp.info): A Focus application.

## Next Steps

- [ ] Define and map keybindings
- [ ] Make it available for WLS2 and Linux (without homebrew casks)
- [ ] Configure sketchybar
- [ ] Configure neovim
- [ ] Configure vscode

## Tools to try

- [ ] [Ddgr](https://github.com/jarun/ddgr): DuckDuckGo from the terminal.
- [ ] [Fz](https://github.com/mrjohannchang/fz.sh): A plugin that seamlessly adds fuzzy search to tab completion.
- [ ] [Aerospace](https://github.com/nikitabobko/AeroSpace): A window manager for MacOS.
