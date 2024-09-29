#!/usr/bin/fish

# Install sway, waybar, dunst, fuzzel, etc...
sudo dnf install -y sway waybar dunst fuzzel pamixer \
	pulseaudio-utils brightnessctl playerctl

# Link configs to the config directory
set SCRIPT_DIR (cd (dirname (status --current-filename)); and pwd)
rm -rf ~/.config/waybar
ln -s $SCRIPT_DIR/../conf/waybar ~/.config/waybar
rm -rf ~/.config/sway
ln -s $SCRIPT_DIR/../conf/sway ~/.config/sway
rm -rf ~/.config/dunst
ln -s $SCRIPT_DIR/../conf/dunst ~/.config/dunst
rm -rf ~/.config/fuzzel
ln -s $SCRIPT_DIR/../conf/fuzzel ~/.config/fuzzel
