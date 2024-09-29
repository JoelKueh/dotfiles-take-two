#!/usr/bin/fish

# Install tmux / tpm
sudo dnf install -y tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
~/.tmux/plugins/tpm/bin/install_plugins

# Update Configs
set SCRIPT_DIR (cd (dirname (status --current-filename)); and pwd)
rm -rf ~/.tmux.conf
ln -s $SCRIPT_DIR/../conf/.tmux.conf ~/.tmux.conf
tmux source ~/.tmux.conf
~/.tmux/plugins/tpm/scripts/install_plugins.sh
