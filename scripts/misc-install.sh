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
	iotop bmap-tools network-manager-openvpn bat -y >/dev/null 2>&1 || { echo "fail"; exit 1; }

YTOP_PACKAGE=/tmp/ytop-package.tar.gz
wget -O $YTOP_PACKAGE https://github.com/cjbassi/ytop/releases/download/0.6.2/ytop-0.6.2-x86_64-unknown-linux-gnu.tar.gz
tar -xvf $YTOP_PACKAGE
cp ytop /urs/local/bin/
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