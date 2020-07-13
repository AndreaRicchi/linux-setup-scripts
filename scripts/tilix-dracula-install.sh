#!/bin/sh

# install
sudo apt install tilix -y || (echo "Tilix installation failed" && exit 1)

# tilix config
sudo update-alternatives --config x-terminal-emulator || (echo "Tilix configuration failed" && exit 1)
sudo ln -s /etc/profile.d/vte-2.91.sh /etc/profile.d/vte.sh || (echo "Symbolic link creation failed" && exit 1)

# tilix dracula theme
mkdir -p ~/Projects/dracula
git clone https://github.com/dracula/tilix.git ~/Projects/dracula/tilix || (echo "Tilix dracula theme clone failed" && exit 1)
mkdir -p ~/.config/tilix/schemes
ln -s ~/Projects/dracula/tilix/Dracula.json ~/.config/tilix/schemes/Dracula.json || (echo "Symbolic link creation failed" && exit 1)
