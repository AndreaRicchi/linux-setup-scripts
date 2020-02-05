#!/bin/sh

# Packages
sudo apt install -y build-essential git gcc gcc-multilib g++ g++-multilib gdb \
	vim repo clang-format git-extras picocom libncurses5-dev libgl1-mesa-dev \
	parcellite cppcheck kdiff3

# Git config
git config --global credential.helper store
git config --global --add merge.tool kdiff3
