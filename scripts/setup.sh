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
