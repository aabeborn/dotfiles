#!/bin/bash

source ./scripts/utils/index.sh

# Install Homebrew
install_brew() {
    echo "Installing Homebrew📦🍺 ..."

    if check_brew; then
        echo "Homebrew is already installed. ✅"
        return 0
    fi

    # Install Homebrew based on the system architecture
    if [[ $(uname -m) == "arm64" ]]; then
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    else
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi

    # Ensure the brew path is added to the shell profile
    echo 'eval $(/opt/homebrew/bin/brew shellenv)' >> /Users/$USER/.zprofile
    eval $(/opt/homebrew/bin/brew shellenv)

    echo 'Done ✅'
}

# Uninstall Homebrew
uninstall_brew() {
    if ! check_brew; then
        echo "❌ Error: Homebrew is not installed."
        return 1
    fi
    echo "Uninstalling Homebrew🗑️ ..."

    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/uninstall.sh)"

    # If macos then remove login scripts
    if is_macos; then
        osascript -e 'tell application "System Events" to delete login item "AltTab"'
        osascript -e 'tell application "System Events" to delete login item "RunCat"'
        osascript -e 'tell application "System Events" to delete login item "Ice"'
        osascript -e 'tell application "System Events" to delete login item "Raycast"'
        osascript -e 'tell application "System Events" to delete login item "Unsplash Wallpapers"'
        osascript -e 'tell application "System Events" to delete login item "Rectangle"'
    fi

    echo 'Done ✅'
}

# Check if Homebrew is installed
check_brew() {
    if command -v brew &> /dev/null; then
        return 0  # Homebrew is installed
    else
        return 1  # Homebrew is not installed
    fi
}

# Update Homebrew and installed apps
update_brew() {
    echo "Updating Homebrew and apps 🔄 ..."

    if ! check_brew; then
        echo "❌ Error: Homebrew is not installed."
        return 1
    fi

    brew update
    brew upgrade

    if is_macos; then
        mas upgrade
    fi

    echo 'Done ✅'
}

# Install brew packages
install_brew_packages() {
    echo "Installing brew packages💽 ..."
    if ! check_brew; then
        echo "❌ Error: Homebrew is not installed."
        return 1
    fi
    # Be sure to be in the dotfiles folder
    cd $1
    brew bundle --file=./brew/base/Brewfile

    echo 'Done ✅'
}

# Install macOS-specific brew packages (Cask)
install_brew_macos_packages() {
    echo "Installing macOS brew cask packages 🍏 ..."
    if ! check_brew; then
        echo "❌ Error: Homebrew is not installed."
        return 1
    fi
    # Be sure to be in the dotfiles folder
    cd $1
    brew bundle --file=./brew/macos/Brewfile

    # Add items to login (macOS apps to start automatically)
    osascript -e 'tell application "System Events" to make login item at end with properties {name:"Runcat", path:"/Applications/Runcat.app", hidden:false}'
    osascript -e 'tell application "System Events" to make login item at end with properties {name:"Unsplash Wallpapers", path:"/Applications/Unsplash Wallpapers.app", hidden:false}'
    osascript -e 'tell application "System Events" to make login item at end with properties {name:"Raycast", path:"/Applications/Raycast.app", hidden:false}'
    osascript -e 'tell application "System Events" to make login item at end with properties {name:"Rectangle", path:"/Applications/Rectangle.app", hidden:false}'
    osascript -e 'tell application "System Events" to make login item at end with properties {name:"AltTab", path:"/Applications/AltTab.app", hidden:false}'
    osascript -e 'tell application "System Events" to make login item at end with properties {name:"Ice", path:"/Applications/Ice.app", hidden:false}'

    echo 'Done ✅'
}
