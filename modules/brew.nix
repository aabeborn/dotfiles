{ config, lib, pkgs, self, nixpkgs, homebrew-bundle, homebrew-core, homebrew-cask, nikitabobko-tap, felixKratz-tap, bun-tap, user, ... }:

{
  nix-homebrew = {
    inherit user;

    enable = true;
    enableRosetta = true;
    autoMigrate = true;

    # Taps declaration. Need for use specific taps.
    # !Important always add homebrew- before the name
    taps = {
      "homebrew/homebrew-core" = homebrew-core;
      "homebrew/homebrew-cask" = homebrew-cask;
      "homebrew/homebrew-bundle" = homebrew-bundle;
      "oven-sh/homebrew-bun" = bun-tap;
      "nikitabobko/homebrew-tap" = nikitabobko-tap;
      "FelixKratz/homebrew-formulae" = felixKratz-tap;
    };
    mutableTaps = false;
  };

  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      upgrade = true;
      cleanup = "uninstall";
    };

    # Cask packages
    casks = [
      # Browser
      "brave-browser"
      "zen-browser"
      "arc"
      # Programming
      "zed" # IDE
      "visual-studio-code" # IDE
      "wezterm" # Terminal
      "podman-desktop" # Containers handler
      "warp" # Terminal
      # System
      "raycast" # Spotlight alternative
      # "nikitabobko/tap/aerospace" # Window tiles manager
      "rectangle"
      "alt-tab" # Switch between open tabs and programs
      # Personal
      "spotify"
      "whatsapp"
      "telegram"
      "notion"
      "discord"
      "figma"
      "amazon-photos"
      # Fonts
      "font-fira-code-nerd-font"
      "font-geist-mono-nerd-font"
      "font-jetbrains-mono-nerd-font"
    ];

    brews = [
      # Terminal tools
      "zoxide" # Smarter cd command
      "eza" # ls command replacement
      "bat" # cat command replacement
      "tmux" # Terminal multiplexer
      "starship" # Shell prompt
      "gitui" # Git UI tool
      "awscli" # AWS CLI
      # Development
      "git"
      "gitmoji" # Git commit formatter
      "neovim" # Editor
      "oven-sh/bun/bun" # Node replacement
      "pnpm" # Node package manager
      "fnm" # Node version handler
      # Macos packages
      "mas" # Handle installation of apps from App Store
      "sketchybar" # Use to change appbar design on MacOs
      "zsh-autosuggestions" # Zsh plugin for autosuggestions and completions
    ];

    # Apps from App Store
    masApps = {
      "Unsplash Wallpapers" = 1284863847; # Dynamic backgrounds app
      "RunCat" = 1429033973; # Small cat running in the appbar to show system load
      "Dashlane" = 517914548; # Password manager
      "Focus" = 1423210932; # Application for focusing
    };
  };
}
