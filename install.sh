
# NeoVim Configuration ########################################################
sudo dnf install -y neovim

# Copying Configs 
rm -rf ~/.config/nvim/
ln -s $PWD/nvim ~/.config/nvim
