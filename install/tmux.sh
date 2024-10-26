#!/usr/bin/bash

# Install tmux / tpm
sudo dnf install -y tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
~/.tmux/plugins/tpm/bin/install_plugins

# Update Configs
SCRIPT=$(realpath "$0")
DIR=$(dirname "$SCRIPT")
rm -rf ~/.tmux.conf
ln -s $DIR/../conf/.tmux.conf ~/.tmux.conf
tmux source ~/.tmux.conf
~/.tmux/plugins/tpm/scripts/install_plugins.sh
