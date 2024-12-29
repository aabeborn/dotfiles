#!/bin/bash

echo "-----------------------------------"
echo "----- aabeborn's pc setup🧙‍♂️🪄 -----"
echo "-----------------------------------"
echo $'\nThat\'s crazy! a new pc! Let\'s goo! Or wait, you have simply messed up your current one... as usual🤷‍♂️?'

echo $'\nWhat would you like to do?'
echo $'1 - Setup you new pc'
echo $'2 - Update your apps'
echo $'3 - Clean up your current pc'
echo $'4 - Regenerate your dotfiles'
echo $'5 - Reset MacOS preferences'
echo $'6 - Exit'

read -p "Enter your choice: " choice

case $choice in
    1)
        source ./scripts/install.sh
        install_programs

        echo "That's it, all done! 🌈 Magic"
        echo "Bye bye see'ya! 👋"
        ;;
    2)
        echo "Hey you lazy guy🖕! Spotted! Take a ☕️ meanwhile I update your apps... "
        source ./scripts/utils/brew.sh
        update_brew
    
        echo "That's it, all done! 🌈 Magic"
        echo "Bye bye see'ya! 👋"
        ;;
    3)
        echo $'As expected, you have messed up your pc again... 😑🙄'
        source ./scripts/uninstall.sh
        uninstall_programs
        ;;
    4)
        echo "Uhh big changes there to your dotfiles! I'll help you to get a clean setup"
        source ./scripts/utils/stow.sh
        refresh_stow
        echo "That's it, all done! 🌈 Magic"
        echo "Bye bye see'ya! 👋"
        exit 0
        ;;
    5)
        echo "Oh dear, your mac doesn't seem ok! Let's get back the real user experience..."
            source ./scripts/utils/macos.sh
            if is_macos; then
                restore_defaults_preferences
            else
                echo "Wait a minuteeee, stupid piece of junk memes, you are not on a mac? Want to troll your best friend, aren't you?"
                exit 1
            fi
        echo "That's it, all done! 🌈 Magic"
        echo "Bye bye see'ya! 👋"
        exit 0
        ;;
    6)
        echo "Bye bye see'ya! 👋"
        exit 0
        ;;
    *)
        echo "Wtf are you searching man? I'll quit!"
        exit 1
        ;;
esac