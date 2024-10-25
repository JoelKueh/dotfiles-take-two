#!/usr/bin/fish

# Download the theme files.
rm -rf $HOME/.themes/
mkdir -p $HOME/.themes/
wget -qO- https://github.com/EliverLara/Nordic/releases/download/v2.2.0/Nordic-bluish-accent.tar.xz \
	| tar xvJ -C /tmp

# Move the theme into the themes folder.
sudo cp -r /tmp/Nordic-bluish-accent /usr/share/themes/

