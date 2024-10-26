#!/usr/bin/bash

# Enable the nwg-shell copr repository.
sudo dnf copr enable -y tofik/nwg-shell
sudo dnf install -y nwg-shell

# Remove the old configs.
CONF=$HOME/.config
SHARE=$HOME/.local/share
rm -rf \
	$CONF/foot \
	$CONF/gtk-3.0 \
	$CONF/gtklock \
	$CONF/nwg-displays \
	$CONF/nwg-dock \
	$CONF/nwg-drawer \
	$CONF/nwg-look \
	$CONF/nwg-panel \
	$CONF/sway \
	$CONF/swaync \
	$SHARE/nwg-look \
	$SHARE/nwg-shell-config

# Link the files in the nwg directory to their respective configs.
SCRIPT=$(realpath "$0")
DIR=$(dirname "$SCRIPT")
NWGDIR=$(realpath "$DIR/../conf/nwg")
ln -s \
	$NWGDIR/conf/foot \
	$NWGDIR/conf/gtk-3.0 \
	$NWGDIR/conf/gtklock \
	$NWGDIR/conf/nwg-displays \
	$NWGDIR/conf/nwg-dock \
	$NWGDIR/conf/nwg-drawer \
	$NWGDIR/conf/nwg-look \
	$NWGDIR/conf/nwg-panel \
	$NWGDIR/conf/sway \
	$NWGDIR/conf/swaync \
	$CONF
ln -s \
	$NWGDIR/share/nwg-look \
	$NWGDIR/share/nwg-shell-config \
	$SHARE
