#!/bin/sh

# System update
sudo apt update
sudo apt full-upgrade

# Packages
sudo apt install -y build-essential git gcc gcc-multilib g++ g++-multilib gdb \
	vim repo clang-format git-extras picocom libncurses5-dev libgl1-mesa-dev \
	parcellite cppcheck kdiff3 tilix

# Tilix config
sudo update-alternatives --config x-terminal-emulator

mkdir -p ~/.config/tilix/schemes
wget https://github.com/clrxbl/tilix-snazzy/raw/master/snazzy.json -O ~/.config/tilix/schemes/snazzy.json

sudo ln -s /etc/profile.d/vte-2.91.sh /etc/profile.d/vte.sh

# Git config
git config --global credential.helper store
git config --global --add merge.tool kdiff3
git config --global core.editor "vim"

# User groups
sudo adduser $USER dialout
