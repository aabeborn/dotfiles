{ config, pkgs, lib, user ? "aabeborn", ... }:
let
  username = "aabeborn";
in {
  home = {
    username = "aabeborn";
    homeDirectory = "/Users/aabeborn";
    stateVersion = "24.05";
    # Dotfile management
    file = {
      # Zsh Configuration
      ".zshrc".source = ../zsh/zshrc;
      # Neovim Configuration (remove nested home.file)
      # ".config/nvim" = {
      #   source = ../nvim;
      #   recursive = true;
      # };
      # Zed Ide Configuration
      ".config/zed" = {
        source = ../zed;
        recursive = true;
      };
      # Git Configuration
      ".config/git" = {
        source = ../git;
        recursive = true;
      };
      # Bat Configuration
      ".config/bat" = {
        source = ../bat;
        recursive = true;
      };
      # Tmux Configuration
      # ".config/tmux/tmux.conf".source = ../tmux/tmux.conf;
      # WezTerm Configuration
      ".wezterm.lua".source = ../wezterm/wezterm.lua;
      # Starship Configuration
      ".config/starship/starship.toml".source = ../starship/starship.toml;
       # Sketchybar Configuration (remove nested home.file)
      # ".config/sketchybar" = {
      #   source = ../sketchybar;
      #   recursive = true;
      # };
    };
  };
  # Shell configuration (minimal, as detailed config is in dotfiles)
  # programs.zsh = { 
  #   enable = true;
  #   enableCompletion = true;
  # };
  # # Minimal Git configuration
  # programs.git = {
  #   enable = true;
  # };
  programs.home-manager.enable = true;
}
