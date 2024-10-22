#!/usr/bin/fish

# Download the theme files.
rm -rf $HOME/.themes/
mkdir -p $HOME/.themes/
wget -qO- https://github.com/EliverLara/Nordic/releases/download/v2.2.0/Nordic-bluish-accent.tar.xz \
	| tar xvJ -C $HOME/.themes/

# Link the gtk settings folders.
set SCRIPT_DIR (cd (dirname (status --current-filename)); and pwd)
rm -rf $HOME/.config/gtk-3.0
rm -rf $HOME/.config/gtk-4.0
ln -s $SCRIPT_DIR/../conf/gtk-3.0 ~/.config/gtk-3.0
ln -s $SCRIPT_DIR/../conf/gtk-4.0 ~/.config/gtk-4.0

# Set the gtk settings
gsettings set org.gnome.desktop.interface gtk-theme "Nordic"
gsettings set org.gnome.desktop.wm.preferences theme "Nordic"

