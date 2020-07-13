#!/bin/bash

# Editors
sudo apt install vim

# C++ tools
sudo apt install gcc gcc-multilib g++ g++-multilib cppcheck clang-format gdb

# Tools
sudo apt install picocom git libgl1-mesa-dev fonts-firacode python pv tree iotop bmap-tools

# Dialout setup
sudo adduser $(whoami) dialout
