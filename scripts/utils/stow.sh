#!/bin/bash
source './scripts/utils/index.sh'

# Config folder location
CONFIG_DIR="${HOME}/.config"

setup_stow() {
    echo "Setting up dotfiles using stow🪛🔗 ..."

    # Check if 'stow' is installed
    check_stow
    # Check if the .config folder exists, create it if not
    if [ ! -d "$CONFIG_DIR" ]; then
        mkdir -p $CONFIG_DIR
    fi

    # Be sure to be in the dotfiles folder
    cd $1

    # Stow configurations
    stow -v -R --restow --ignore=zsh -t "$CONFIG_DIR" config
    cd config
    stow -v -R --restow -t "$HOME" zsh

    # macOS specific configurations (preferences)
    # if is_macos; then
    #     echo "Stowing macOS preferences..."
    #     stow -v -R --adopt -t "$HOME/Library/Preferences"  raycast alt-tab rectangle ice
    # fi

    # Correct the path
    cd $1

    echo 'Done ✅'
}

check_stow() {
    if ! command -v stow &> /dev/null
    then
        echo "❌ stow could not be found. Please install it first."
        exit 1
    fi
}

remove_dotfiles() {
    echo "Removing dotfiles🗑️🔗 ..."
    # Go to config folder
    cd $1
    cd config
    # Removing all stowed dotfiles
    stow -D -t "$HOME" zsh
    stow -D -t "$CONFIG_DIR" *

    # Restore correct path
    cd $1

    echo 'Done ✅'
}

refresh_dotfiles() {
    echo "Refreshing dotfiles 🔄🔗 ..."

    # Remove existing dotfiles and setup new ones
    remove_dotfiles
    setup_stow

    echo 'Done ✅'
}
