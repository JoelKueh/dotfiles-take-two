#!/usr/bin/fish

# Move the theme into the themes folder.
set SCRIPT_DIR (cd (dirname (status --current-filename)); and pwd)
sudo cp -r $SCRIPT_DIR/../resources/themes/* /usr/share/themes/

# Move the wallpapers into the wallpapers folder.
sudo mkdir /usr/share/backgrounds/mybackgrounds
sudo cp -r $SCRIPT_DIR/../resources/wallpapers/* /usr/share/backgrounds/mybackgrounds
