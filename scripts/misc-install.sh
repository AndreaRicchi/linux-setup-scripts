#!/bin/bash

# Editors
sudo apt install vim -y

# C++ tools
sudo apt install gcc gcc-multilib g++ g++-multilib cppcheck clang-format gdb -y

# Tools
sudo apt install picocom git libgl1-mesa-dev fonts-firacode python pv tree iotop bmap-tools network-manager-openvpn -y

# General setup
sudo adduser $(whoami) dialout
git config --global core.editor "vim"
