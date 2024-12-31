setup_macos() {
    echo "Setting up MacOS preferences 🍏⚙️ ...";

    # Dock defaults
    defaults write com.apple.dock "orientation" -string "right" # Dock on the left
    defaults write com.apple.dock "autohide" -bool "true" # Autohide dock
    defaults write com.apple.dock "tilesize" -int "48" # Dock icon size
    defaults write com.apple.dock "show-recents" -bool "false" # Remove recent apps
    # persistent apps in the docs
    defaults write com.apple.dock persistent-apps -array # Remove all apps

    add_to_dock "/System/Applications/System Settings.app" # System Preferences defaults
    add_to_dock "/Applications/Ghostty.app" # Ghostty Terminal
    add_to_dock "/Applications/Arc.app" # Arc Browser
    add_to_dock "/Applications/Spotify.app" # Spotify
    add_to_dock "/Applications/Dashlane.app" # Dashlane
    add_to_dock "/Applications/Notion.app" # Notion
    add_to_dock "/Applications/Notion Calendar.app" # Notion Calendar
    add_to_dock "/Applications/Spark Desktop.app" # Readdle Spark

    # Finder defaults
    defaults write NSGlobalDomain "AppleShowAllExtensions" -bool "true" # Show all file extensions
    defaults write com.apple.finder "AppleShowAllFiles" -bool "false" # Show hidden files
    defaults write com.apple.finder "ShowPathbar" -bool "true" # Show path bar
    defaults write com.apple.finder "FXEnableExtensionChangeWarning" -bool "false"  # Disable warning when changing file extension

    # Desktop defaults
    defaults write com.apple.finder "ShowHardDrivesOnDesktop" -bool "true" # Show hard drives on desktop
    defaults write com.apple.finder "ShowExternalHardDrivesOnDesktop" -bool "true" # Show external hard drives on desktop
    defaults write com.apple.finder "ShowRemovableMediaOnDesktop" -bool "true" # Show removable media on desktop

    # Setup MacOS preferences 
    defaults write -g AppleInterfaceStyleSwitchesAutomatically -bool true # Auto switch between light and dark mode 
    defaults write -g AppleHighlightColor -string "1.000000 0.874510 0.701961 Orange" # Highlight color
    defaults write -g AppleAccentColor -int 3 # Accent color

    # Disable mission control things
    defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 32 "{enabled = 0;}"
    defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 33 "{enabled = 0;}"
    defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 34 "{enabled = 0;}"
    defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 35 "{enabled = 0;}"
    defaults write com.apple.dock wvous-tl-corner -int 0  # Top-left
    defaults write com.apple.dock wvous-tr-corner -int 0  # Top-right
    defaults write com.apple.dock wvous-bl-corner -int 0  # Bottom-left
    defaults write com.apple.dock wvous-br-corner -int 0  # Bottom-right

    # Disable spotlight
    defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 64 "{enabled = 0;}"
    defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 65 "{enabled = 0;}"
     
    defaults write com.apple.loginwindow StartupDelay -int 5 # Decrease startup delay
    defaults write com.apple.screensaver askForPasswordDelay -int 0 # Ask for password immediately after sleep or screen saver begins

    # Keyboard defaults
    defaults write NSGlobalDomain KeyRepeat -int 1 # Adjust key repeat speed
    defaults write NSGlobalDomain InitialKeyRepeat -int 10 # Adjust initial key repeat speed

    # Browser
    defaults write NSGlobalDomain WebBrowser -string "/Applications/Arc.app" # Set default browser to Arc

    # Restart Finder
    killall Finder
    # Restart Dock
    killall Dock
    # Restart SystemUIServer
    killall SystemUIServer


    sudo pmset -c displaysleep 15    # Display sleep after 10 minutes
    sudo pmset -c disksleep 20       # Disk sleep after 10 minutes
    sudo pmset -c sleep 30           # Computer sleep after 30 minutes
    sudo pmset -b displaysleep 5     # Display sleep after 10 minutes
    sudo pmset -b disksleep 10       # Disk sleep after 10 minutes
    sudo pmset -b sleep 10           # Computer sleep after 30 minutes
    sudo pmset -b powernap 0         # Disable Power Nap on battery
    sudo pmset standbydelay 3600    # Standby delay of 1 hour

    echo $'Done ✅\n'
}


# Function to add an app to the Dock
add_to_dock() {
    defaults write com.apple.dock persistent-apps -array-add "<dict>
        <key>tile-data</key>
        <dict>
            <key>file-data</key>
            <dict>
                <key>_CFURLString</key>
                <string>$1</string>
                <key>_CFURLStringType</key>
                <integer>0</integer>
            </dict>
        </dict>
    </dict>"
}

restore_defaults_preferences() {
    echo "Restoring MacOS preferences 🔄🍏⚙️ ...";
    defaults delete com.apple.dock
    defaults delete com.apple.finder
    defaults delete com.apple.symbolichotkeys
    defaults delete NSGlobalDomain

    killall Finder
    killall Dock
    killall SystemUIServer
    sudo pmset restoredefaults
    sudo mdutil -a -i on

    echo $'Done ✅\n'
}