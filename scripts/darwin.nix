{ config, lib, pkgs, ... }:

{
  # system.activationScripts = {
  #   preUserActivation.text = ''
      # Function to install Xcode Command Line Tools
      # install_xcode_tools() {
      #   if ! xcode-select -p &> /dev/null; then
      #     echo "Installing Xcode Command Line Tools..."
      #     xcode-select --install

      #     # Wait for installation to complete
      #     while ! xcode-select -p &> /dev/null; do
      #       echo "Waiting for Xcode Command Line Tools to install..."
      #       sleep 5
      #     done
      #     echo "Xcode Command Line Tools installed successfully."
      #   else
      #     echo "Xcode Command Line Tools are already installed."
      #   fi
      # }

      # Function to install Rosetta 2 on Apple Silicon
    #   install_rosetta() {
    #     if [[ $(uname -m) == "arm64" ]] && ! /usr/bin/pgrep -q oahd; then
    #       echo "Installing Rosetta 2..."
    #       /usr/sbin/softwareupdate --install-rosetta --agree-to-license

    #       # Verify Rosetta installation
    #       if /usr/bin/pgrep -q oahd; then
    #         echo "Rosetta 2 installed successfully."
    #       else
    #         echo "Rosetta 2 installation failed."
    #       fi
    #     else
    #       echo "Rosetta 2 is already installed or not needed."
    #     fi
    #   }

    #   # Main execution
    #   if [[ "$(uname)" == "Darwin" ]]; then
    #     install_xcode_tools
    #     install_rosetta
    #   fi
    # '';
  # };
}
