#!/bin/bash

if [ "$EUID" -ne 0 ]
	then echo "Please run as root"
	exit
fi

# Editors
printf "Installing vim... "
apt install vim -y >/dev/null 2>&1 || { echo "fail"; exit 1; }
echo "done"

# Utils
printf "Installing utility packages... "
apt install picocom git libgl1-mesa-dev fonts-firacode python pv tree \
	iotop bmap-tools network-manager-openvpn -y >/dev/null 2>&1 || { echo "fail"; exit 1; }
echo "done"

# General setup
echo "Updating global configs... "

read -p "Add user to dialout group? [y/N]" -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
	adduser "$USER" dialout >/dev/null 2>&1 || { echo "fail"; exit 1; }
fi

read -p "Add user to vboxusers group? [y/N]" -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
	adduser "$USER" vboxusers >/dev/null 2>&1 || { echo "fail"; exit 1; }
fi

git config --global core.editor "vim" >/dev/null 2>&1 || { echo "fail"; exit 1; }
echo "done"