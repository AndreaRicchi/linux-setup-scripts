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

# Brave browser
sudo apt install apt-transport-https curl

curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -

echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list

sudo apt update

sudo apt install brave-browser

# Git config
git config --global credential.helper store
git config --global --add merge.tool kdiff3
git config --global core.editor "vim"

# User groups
sudo adduser $USER dialout
