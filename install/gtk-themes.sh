#!/usr/bin/bash

# Move the theme into the themes folder.
SCRIPT=$(realpath "$0")
DIR=$(dirname "$SCRIPT")
sudo cp -r $DIR/../resources/themes/* /usr/share/themes/

# Move the wallpapers into the wallpapers folder.
sudo mkdir /usr/share/backgrounds/mybackgrounds
sudo cp -r $DIR/../resources/wallpapers/* /usr/share/backgrounds/mybackgrounds
