#!/bin/bash

if [ "$EUID" -ne 0 ]
	then echo "Please run as root"
	exit
fi

printf "Installing Tilix... "
apt install tilix -y >/dev/null 2>&1 || { echo "fail"; exit 1; }
echo "done"

printf "Setting up Tilix... "
ln -s /etc/profile.d/vte-2.91.sh /etc/profile.d/vte.sh >/dev/null 2>&1 || { echo "fail"; exit 1; }
update-alternatives --config x-terminal-emulator || { echo "fail"; exit 1; }
echo "done"

printf "Installing Dracula theme... "
mkdir -p ~/Projects/dracula >/dev/null 2>&1 || { echo "fail"; exit 1; }
git clone https://github.com/dracula/tilix.git ~/Projects/dracula/tilix >/dev/null 2>&1 || { echo "fail"; exit 1; }
mkdir -p ~/.config/tilix/schemes >/dev/null 2>&1 || { echo "fail"; exit 1; }
ln -s ~/Projects/dracula/tilix/Dracula.json ~/.config/tilix/schemes/Dracula.json >/dev/null 2>&1 || { echo "fail"; exit 1; }
echo "done" 