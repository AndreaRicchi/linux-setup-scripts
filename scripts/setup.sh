#!/bin/bash

set -e

SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")
RESOURCESPATH=$SCRIPTPATH/../resources
SYSTEMFONTSPATH=$HOME/.local/share/fonts/

setup_color() {
	# Only use colors if connected to a terminal
	if [ -t 1 ]; then
		RED=$(printf '\033[31m')
		GREEN=$(printf '\033[32m')
		YELLOW=$(printf '\033[33m')
		BLUE=$(printf '\033[34m')
		BOLD=$(printf '\033[1m')
		RESET=$(printf '\033[m')
	else
		RED=""
		GREEN=""
		YELLOW=""
		BLUE=""
		BOLD=""
		RESET=""
	fi
}

meslolgs_font_install() {
	sudo cp "$RESOURCESPATH"/*.ttf "$SYSTEMFONTSPATH"
}

brave_browser_install() {
	sudo apt install apt-transport-https curl gnupg
	echo
	curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | \
		sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -
	echo
	echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | \
		sudo tee /etc/apt/sources.list.d/brave-browser-release.list
	sudo apt update
	echo
	sudo apt install -y brave-browser
}

# main

if [ "$EUID" -ne 0 ]
	then echo "Please run as root"
	exit
fi

setup_color

clear

printf "${YELLOW}Install MesloLGS NF font pack? [Y/n]${RESET} "
read opt
case $opt in
	y*|Y*|"") meslolgs_font_install ;;
	*) ;;
esac

clear

printf "${YELLOW}Install Brave browser? [Y/n]${RESET} "
read opt
case $opt in
	y*|Y*|"") brave_browser_install ;;
	*) ;;
esac