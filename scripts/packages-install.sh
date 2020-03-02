#!/bin/sh

# System update
sudo apt update
sudo apt full-upgrade

# Packages
sudo apt install -y build-essential git gcc gcc-multilib g++ g++-multilib gdb \
	vim repo clang-format git-extras picocom libncurses5-dev libgl1-mesa-dev \
	cppcheck tilix kdiff3-qt shellcheck

# Tilix config
sudo update-alternatives --config x-terminal-emulator
sudo ln -s /etc/profile.d/vte-2.91.sh /etc/profile.d/vte.sh

# Git config
git config --global credential.helper store
git config --global --add merge.tool kdiff3
git config --global core.editor "vim"
git config --global user.name ""
git config --global user.email ""

# User groups
sudo adduser $USER dialout
