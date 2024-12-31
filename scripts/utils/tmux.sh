!#bin/bash

# Setup tmux plugins and package manager
setup_tmux() {
    cd $1
    cd config/tmux

    # create the plugins folder
    mkdir -p plugins
    cd plugins

    # Clone TPM package manager
    git clone https://github.com/tmux-plugins/tpm
}
