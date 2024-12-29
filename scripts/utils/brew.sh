#!/bin/bash

source ./scripts/utils/index.sh

# Install Homebrew
install_brew() {
    echo "Installing Homebrew📦🍺 ..."; 
    if check_brew; then
        echo "❌ Error: Homebrew is already installed."
        exit 1 
        return 1
    fi
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)";

    echo 'eval $(/opt/homebrew/bin/brew shellenv)' >> /Users/$USER/.zprofile
    eval $(/opt/homebrew/bin/brew shellenv)

    
    echo $'Done ✅\n'
}

# Uninstall Homebrew
uninstall_brew() { 
    if ! check_brew; then
        echo "Error: Homebrew is not installed."
        return 1
    fi
    echo "Uninstalling Homebrew🗑️ ..."; 
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/uninstall.sh)";
    
}

# Check if Homebrew is installed
check_brew() { 
    if command -v brew &> /dev/null; 
        then return true; 
    fi; 
    return false; 
}

# Update Homebrew
update_brew() { 
    echo "Updating Homebrew  and apps 🔄..."; 
    brew update; 
    brew upgrade;
    if is_macos ; then
       mas upgrade;
    fi
    echo $'Done ✅\n'
}

# Install brew packages
install_brew_packages() {
    install_brew_packages
    echo "Installing brew packages💽 ..."; 

    brew bundle --file=./brew/base; 
    echo $'Done ✅\n'
}

install_brew_macos_packages() {
    echo "Installing brew cask packages 🍏 ..."; 
    brew bundle --file=./brew/macos; 
    
    # Add items to start automatically
    # Runcat
    osascript -e 'tell application "System Events" to make login item at end with properties {name:"Runcat", path:"/Applications/Runcat.app", hidden:false}'
    osascript -e 'tell application "System Events" to make login item at end with properties {name:"Unsplash Wallpapers", path:"/Applications/Unsplash Wallpapers.app", hidden:false}'
    brew services start alt-tab
    brew services start raycast
    brew services start rectangle
    brew services start ice

    echo $'Done ✅\n'
}

