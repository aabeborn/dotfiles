{
  description = "aabeborn Nix Flakes configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs }:
  let
    configuration = { pkgs, ... }: {
      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget
      environment.systemPackages =
        [ 
	  pkgs.vim
        ];

      # Auto upgrade the nix package and the daemon service
      services.nix-daemon.enable = true;

      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";

      # Enable alternative shell support in nix-darwin.
      # programs.fish.enable = true;

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 5;

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";

      # Mac system default settings
      system.defaults = {
        
      };
      security.pam.enableSudoTouchIdAuth = true;

    };
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#Mac-mini-di-Andrea
    darwinConfigurations."aabeborn" = nix-darwin.lib.darwinSystem {
      modules = [ configuration ];
    };
  };
}