#!/bin/bash

source ./scripts/utils/brew.sh
source ./scripts/utils/macos.sh
source ./scripts/utils/stow.sh

install() {
    echo $'Let\'s make your new pc finally awesome!🚀'

    if [ "$SHELL" != "/bin/zsh" ]; then
        if ! command -v zsh &> /dev/null; then
            echo "Zsh is not installed. Please install zsh and rerun the script."
            exit 1
        fi
        echo "Zsh is not the current shell. I'll do it for you"
        sudo chsh -s /bin/zsh
        zsh
    exit 1
fi

    if is_macos; then
        xcode-select --install
    
    # Install homebrew
    install_brew
    # Install brew basic packages
    install_brew_packages

    if is_macos; then
        # Install brew cask packages
        install_brew_macos_packages
        # Add all preferences 
        setup_macos
    fi

    # setup dotfiles
    setup_stow

    echo "❗❗ Restart your system to be sure all changes have taken effect! "
}