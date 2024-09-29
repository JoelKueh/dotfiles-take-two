#!/usr/bin/fish

# Install Neovim
sudo dnf install -y neovim

# Update configs
set SCRIPT_DIR (cd (dirname (status --current-filename)); and pwd)
rm -rf ~/.config/nvim
ln -s $SCRIPT_DIR/../conf/nvim ~/.config/nvim
alias --save vi "nvim"
