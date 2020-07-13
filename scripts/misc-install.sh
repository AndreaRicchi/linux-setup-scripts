#!/bin/bash

# Editors
sudo apt install vim -y

# C++ tools
sudo apt install gcc gcc-multilib g++ g++-multilib cppcheck clang-format gdb -y

# Tools
sudo apt install picocom git libgl1-mesa-dev fonts-firacode python pv tree iotop bmap-tools -y

# Dialout setup
sudo adduser $(whoami) dialout
