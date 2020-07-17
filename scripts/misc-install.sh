#!/bin/bash

if [ "$EUID" -ne 0 ]
	then echo "Please run as root"
	exit
fi

# Editors
printf "Installing vim... "
apt install vim -y >/dev/null 2>&1 || (echo "fail" && exit 1)
echo "done"

# C++ tools
printf "Installing C++ tools... "
apt install gcc gcc-multilib g++ g++-multilib cppcheck clang-format \
	gdb cmake -y >/dev/null 2>&1 || (echo "fail" && exit 1)
echo "done"

# Utils
printf "Installing utility packages... "
apt install picocom git libgl1-mesa-dev fonts-firacode python pv tree \
	iotop bmap-tools network-manager-openvpn -y >/dev/null 2>&1 || (echo "fail" && exit 1)
echo "done"

# General setup
printf "Updating global configs... "
adduser "$(whoami)" dialout >/dev/null 2>&1 || (echo "fail" && exit 1)
git config --global core.editor "vim" >/dev/null 2>&1 || (echo "fail" && exit 1)
echo "done"