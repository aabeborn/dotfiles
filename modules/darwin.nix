{ config, self, pkgs, ... }:

{
  # Nix daemon and experimental features
  services.nix-daemon.enable = true;
  users.users.aabeborn.home = "/Users/aabeborn";
  nix.settings = {
    experimental-features = "nix-command flakes";
  };
  nix.optimise.automatic = true;
  nix.useDaemon = true;

  # System configuration
  system = {
    configurationRevision = self.rev or self.dirtyRev or null;
    stateVersion = 5;
    defaults = {
      finder.AppleShowAllExtensions = true;
      finder.AppleShowAllFiles = true;
      finder.ShowPathbar = true;
      dock.autohide = true;
      dock.orientation = "right";
      dock.tilesize = 48;
      dock.persistent-apps = [
        "/Applications/Dashlane.app"
        "/Applications/Zen Browser.app"
        "/Applications/Spotify.app"
        "/Applications/Zed.app"
        "/Applications/Wezterm.app"
      ];
    };
  };



  # Environment setup
  environment = {
    systemPackages = with pkgs; import ./packages.nix { inherit pkgs; };
    shells = with pkgs; [ zsh bashInteractive ];
    variables = {};
  };

  # Power management
  power.sleep = {
    computer = 30;
    display = 15;
    harddisk = 30;
  };

  # Security
  security.pam.enableSudoTouchIdAuth = true;
}
