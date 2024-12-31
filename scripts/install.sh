#!/bin/bash

# Include utility scripts
source ./scripts/utils/brew.sh
source ./scripts/utils/macos.sh
source ./scripts/utils/stow.sh
source ./scripts/utils/index.sh
source ./scripts/utils/tmux.sh
install() {

    DOTFILES_DIR=$1

    echo $'Let\'s make your new PC finally awesome! 🚀'
    cd $DOTFILES_DIR
    # Ensure the user is using zsh as their shell
    if [ "$SHELL" != "/bin/zsh" ]; then
        if ! command -v zsh &> /dev/null; then
            echo "Zsh is not installed. Please install zsh and rerun the script."
            exit 1
        fi
        echo "Zsh is not the current shell. Changing the shell to zsh..."
        sudo chsh -s /bin/zsh
        # Restart the session with zsh
        exec zsh
    fi

    # Check if macOS, then install Xcode command-line tools
    if is_macos; then
        # Make sure Xcode Command Line Tools are installed
        if ! xcode-select -p &> /dev/null; then
            echo "Installing Xcode Command Line Tools 🔧... "
            xcode-select --install
        else
            echo "Xcode Command Line Tools are already installed.👏"
        fi
    fi

    # Install Homebrew
    install_brew

    # Install Homebrew base packages
    install_brew_packages $DOTFILES_DIR

    # Check if macOS then install macOS brew relative packages and Mac preferences
    if is_macos; then
        install_brew_macos_packages $DOTFILES_DIR
        setup_macos
    fi

    # Add dot files
    setup_stow $DOTFILES_DIR

    # Setup tmux plugins
    setup_tmux $DOTFILES_DIR
}
