source './scripts/utils/brew.sh'
source './scripts/utils/stow.sh'
source './scripts/utils/macos.sh'
source './scripts/utils/index.sh'

uninstall_programs () {
    echo $'Let\'s cleanup your pc!🚀'
    # Remove all dotfiles links
    remove_dotfiles
    # Remove all homebrew packages and homebrew
    uninstall_brew

    if is_macos; then
        # Restore mac os preferences
        restore_defaults_preferences
    fi

    echo "❗❗ Restart your system to be sure all changes have taken effect! "
}
