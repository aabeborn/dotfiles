#!/bin/bash
source './scripts/utils/index.sh'

CONFIG_FOLDER = "${HOME}/.config"

setup_stow() {
    echo "Setup dotfiles using stow🪛🔗 ..."

    # Check if stow is there
    check_stow()

    # Stow links
    # Zsh configuration 
    stow -v -R -t $HOME ./config/zsh/.zshrc
    # Git configuration
    stow -v -R -t $CONFIG_FOLDER/git ./config/git
    # Starship configuration
    stow -v -R -t $CONFIG_FOLDER/starship ./config/starship   
    # Tmux configuration
    stow -v -R -t $CONFIG_HOME/tmux ./config/tmux
    # Ghostty configuration
    stow -v -R -t $CONFIG_FOLDER/ghostty ./config/ghostty
    # Bat configuration
    stow -v -R -t $CONFIG_FOLDER/bat ./config/bat
    # Neovim configuration
    stow -v -R -t $CONFIG_FOLDER/nvim ./config/nvim
    # Zed configuration 
    stow -v -R -t $CONFIG_FOLDER/zed ./config/zed

    if is_macos; then
        ## IDK if this is a good practice but store preferences of some apps here
        stow -v -R -t ~/Library/Preferences ./config/raycast
        stow -v -R -t ~/Library/Preferences ./config/alt-tab
        stow -v -R -t ~/Library/Preferences ./config/rectangle
        stow -v -R -t ~/Library/Preferences ./config/ice

    echo $'Done ✅\n'
}

check_stow() {
    if ! command -v stow &> /dev/null
    then
        echo "❌ stow could not be found. Please install it first."
        exit 1
    fi
}

remove_dotfiles() {
    echo "Remove dotfiles🗑️🔗 ..."
    stow -D -t ~ */
    echo $'Done ✅\n'
}

refresh_dotfiles() {
    echo "Refresh dotfiles 🔄🔗 ..."
    remove_stow
    setup_stow
    echo $'Done ✅\n'
}