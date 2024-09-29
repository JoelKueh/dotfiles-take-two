#!/usr/bin/fish

# Install Kitty
sudo dnf install -y kitty

# Update Configs
set SCRIPT_DIR (cd (dirname (status --current-filename)); and pwd)
rm -rf ~/.config/kitty
ln -s $SCRIPT_DIR/../conf/kitty ~/.config/kitty
