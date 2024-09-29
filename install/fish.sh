#!/usr/bin/bash

# Install fish
sudo dnf install -y fish

# Add fish to the list of valid shells
if ! grep -l "/usr/bin/fish" /etc/shells; then
	echo "/bin/fish" | sudo tee -a /etc/shells
	echo "/usr/bin/fish" | sudo tee -a /etc/shells
	echo "/usr/local/bin/fish" | sudo tee -a /etc/shells
fi

# Change the default shell to fish
if [[ $SHELL != "/usr/bin/fish" ]]; then
	chsh -s /usr/bin/fish
fi

# Select the Nord color theme
fish fish_config theme choose Nord

# Install Nerd Fonts
INVOKE_DIR=$(pwd)

# DejaVu
wget -P ~/.local/share/fonts https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/DejaVuSansMono.zip \
&& cd ~/.local/share/fonts \
&& unzip DejaVuSansMono.zip \
&& rm DejaVuSansMono.zip \
&& fc-cache -fv

# Font Awesome
sudo dnf install -y fontawesome-fonts

# Install OMF
#set SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
#curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install > /tmp/omf-install
#fish /tmp/omf-install --uninstall
#fish /tmp/omf-install && exit
