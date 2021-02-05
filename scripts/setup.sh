#!/bin/bash

set -e

SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")

RESOURCESPATH=$SCRIPTPATH/../resources

TEMPLATESPATH=$SCRIPTPATH/../templates

ZSHRCTEMPLATEPATH=$TEMPLATESPATH/zshrc-template

SYSTEMFONTSPATH=$HOME/.local/share/fonts

QTINSTALLERPATH=/tmp/qt-unified-linux-x64-online.run
QTCREATORTHEMESPATH=$HOME/.config/QtProject/qtcreator/styles
QTCREATORDRACULATHEMEPATH=$QTCREATORTHEMEPATH/dracula.xml

DOCKERSCRIPTPATH=/tmp/get-docker.sh

BTMINSTALLERPATH=/tmp/bottom_amd64.deb

BATCATINSTALLERPATH=/tmp/batcat_amd64.deb

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

zsh_install() {
	sudo apt update
	echo
	sudo apt install -y zsh git curl
	echo
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
}

zsh_theme_plugins_install() {
	cp $ZSHRCTEMPLATEPATH $HOME/.zshrc
	echo
	sudo apt update
	echo
	sudo apt install -y git-extras
	echo
	git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
	echo
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
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

docker_install() {
	curl -fsSL https://get.docker.com -o $DOCKERSCRIPTPATH
	echo
	sudo $DOCKERSCRIPTPATH
}

cpp_tools_install() {
	sudo apt update
	echo
	sudo apt install -y \
		gcc gcc-multilib g++ g++-multilib gdb build-essential \
		cppcheck clang-format cmake picocom libgl1-mesa-dev vim \
		bmap-tools sshpass
	echo
	adduser "$USER" dialout
	echo
	git config --global core.editor "vim"
}

btm_tool_install() {
	curl -L https://github.com/ClementTsang/bottom/releases/download/0.5.7/bottom_0.5.7_amd64.deb -o $BTMINSTALLERPATH
	sudo dpkg -i $BTMINSTALLERPATH
}

batcat_tool_install() {
	curl -L https://github.com/sharkdp/bat/releases/download/v0.17.1/bat_0.17.1_amd64.deb -o $BATCATINSTALLERPATH
	sudo dpkg -i $BATCATINSTALLERPATH
}

main () {
	setup_color

	clear
	if ! which zsh >/dev/null 2>&1; then
		printf "${YELLOW}Install Oh My Zsh? [Y/n]${RESET} "
		read opt
		case $opt in
			y*|Y*|"") zsh_install ;;
			*) ;;
		esac
		exit 0
	fi

	clear
	if which zsh >/dev/null 2>&1; then
		printf "${YELLOW}Install Oh My Zsh theme and plugins? [Y/n]${RESET} "
		read opt
		case $opt in
			y*|Y*|"") zsh_theme_plugins_install ;;
			*) ;;
		esac
	fi

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

	clear
	printf "${YELLOW}Install Docker? [Y/n]${RESET} "
	read opt
	case $opt in
		y*|Y*|"") docker_install ;;
		*) ;;
	esac

	clear
	printf "${YELLOW}Install C++ SDK tools? [Y/n]${RESET} "
	read opt
	case $opt in
		y*|Y*|"") cpp_tools_install ;;
		*) ;;
	esac

	clear
	printf "${YELLOW}Install bottom (top replacement) tool? [Y/n]${RESET} "
	read opt
	case $opt in
		y*|Y*|"") btm_tool_install ;;
		*) ;;
	esac

	clear
	printf "${YELLOW}Install batcat (cat replacement) tool? [Y/n]${RESET} "
	read opt
	case $opt in
		y*|Y*|"") batcat_tool_install ;;
		*) ;;
	esac
}

main