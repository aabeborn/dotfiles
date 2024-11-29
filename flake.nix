{
  description = "aabeborn Nix-Darwin System Flake";

  inputs = {
    # Nix packages registry
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    # Nix integration for MacOs
    darwin = {
      url = "github:LnL7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # Home Manager (Nix) to setup dotfiles
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # Homebrew Nix package: handles the homebrew installation
    nix-homebrew = {
      url = "github:zhaofengli-wip/nix-homebrew";
    };

    # Homebrew taps
    # Base tap
    homebrew-core = {
      url = "github:homebrew/homebrew-core";
      flake = false;
    };
    # Cask tap
    homebrew-cask = {
      url = "github:homebrew/homebrew-cask";
      flake = false;
    };
    # Bundle tap
    homebrew-bundle = {
      url = "github:homebrew/homebrew-bundle";
      flake = false;
    };
    # AeroSpace tap
    nikitabobko-tap = {
      url = "github:nikitabobko/homebrew-tap";
      flake = false;
    };
    # Sketchybar tap
    felixKratz-tap = {
      url = "github:FelixKratz/homebrew-formulae";
      flake = false;
    };
    # Bun tap
    bun-tap = {
      url = "github:oven-sh/homebrew-bun";
      flake = false;
    };

    # tmux plugin manager
    tpm = {
      url = "github:tmux-plugins/tpm";
      flake = false;
    };
  };

  outputs = inputs@{ self, darwin, nixpkgs, nix-homebrew, homebrew-bundle, homebrew-core, homebrew-cask, bun-tap, felixKratz-tap, nikitabobko-tap, home-manager, tpm }:
  let
    user = "aabeborn";
    system = "aarch64-darwin";
  in
  {
    darwinConfigurations.BennPC = darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      specialArgs = {
        inherit (inputs) self nixpkgs homebrew-core homebrew-cask homebrew-bundle bun-tap nikitabobko-tap felixKratz-tap tpm;
        inherit user;
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };
      };
      modules = [
        nix-homebrew.darwinModules.nix-homebrew
        ./scripts/darwin.nix
        ./modules/darwin.nix
        ./modules/brew.nix
        home-manager.darwinModules.home-manager
        {
          users.users.aabeborn.home = "/Users/aabeborn";
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.aabeborn = import ./modules/home.nix {
            inherit (inputs) nixpkgs lib self home-manager tpm;
          };
        }
      ];
    };
    # Optional: default configuration for convenience
    defaultPackage."aarch64-darwin" = self.darwinConfigurations.BennPC.system;
  };
}
