#!/bin/bash

set -e

SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")

RESOURCESPATH=$SCRIPTPATH/../resources
SYSTEMFONTSPATH=$HOME/.local/share/fonts

QTINSTALLERPATH=/tmp/qt-unified-linux-x64-online.run
QTCREATORTHEMESPATH=$HOME/.config/QtProject/qtcreator/styles
QTCREATORDRACULATHEMEPATH=$QTCREATORTHEMEPATH/dracula.xml

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

tilix_terminal_install() {
	sudo apt install -y tilix
	echo
	ln -s /etc/profile.d/vte-2.91.sh /etc/profile.d/vte.sh
	echo
	update-alternatives --config x-terminal-emulator
}

qt_install() {
	wget -O $QTINSTALLERPATH http://download.qt.io/official_releases/online_installers/qt-unified-linux-x64-online.run
	echo
	chmod +x $QTINSTALLERPATH
	echo
	$QTINSTALLERPATH
	echo
	mkdir -p $QTCREATORTHEMESPATH
	echo
	wget -O $QTCREATORDRACULATHEMEPATH https://github.com/dracula/qtcreator/blob/master/dracula.xml
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

clear
printf "${YELLOW}Install Tilix terminal? [Y/n]${RESET} "
read opt
case $opt in
	y*|Y*|"") tilix_terminal_install ;;
	*) ;;
esac

clear
printf "${YELLOW}Install Qt framework? [Y/n]${RESET} "
read opt
case $opt in
	y*|Y*|"") qt_install ;;
	*) ;;
esac