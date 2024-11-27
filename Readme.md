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

## Next Steps
- [ ] make it available for intel Macs
- [ ] Make it available for WLS2 and Linux (without homebrew casks)
- [ ] Get the user and home path from the system
- [ ] Configure sketchybar
- [ ] Configure neovim
- [ ] Configure tmux
- [ ] Add ghostty
- [ ] Configure vscode
