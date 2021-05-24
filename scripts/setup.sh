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
QTCREATORDRACULATHEMEPATH=$QTCREATORTHEMESPATH/dracula.xml

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
	cp "$ZSHRCTEMPLATEPATH" "$HOME"/.zshrc
	echo
	sudo apt update
	echo
	sudo apt install -y git-extras
	echo
	git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"/themes/powerlevel10k
	echo
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}"/plugins/zsh-syntax-highlighting
}

meslolgs_font_install() {
	sudo cp "$RESOURCESPATH"/*.ttf "$SYSTEMFONTSPATH"
}

brave_browser_install() {
	sudo apt install apt-transport-https curl gnupg
	echo
	curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -
	echo
	echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
	sudo apt update
	echo
	sudo apt install -y brave-browser
}

TILIX_THEMES_FOLDER=$HOME/.config/tilix/schemes

tilix_terminal_install() {
	sudo apt install -y tilix
	echo
	ln -s /etc/profile.d/vte-2.91.sh /etc/profile.d/vte.sh
	echo
	update-alternatives --config x-terminal-emulator
	echo
	mkdir -p "$TILIX_THEMES_FOLDER"
	echo
	wget -O "$TILIX_THEMES_FOLDER" https://github.com/dracula/tilix/blob/master/Dracula.json
}

qt_install() {
	wget -O "$QTINSTALLERPATH" http://download.qt.io/official_releases/online_installers/qt-unified-linux-x64-online.run
	echo
	chmod +x "$QTINSTALLERPATH"
	echo
	"$QTINSTALLERPATH"
	echo
	mkdir -p "$QTCREATORTHEMESPATH"
	echo
	wget -O "$QTCREATORDRACULATHEMEPATH" https://github.com/dracula/qtcreator/blob/master/dracula.xml
}

docker_install() {
	curl -fsSL https://get.docker.com -o "$DOCKERSCRIPTPATH"
	echo
	sudo "$DOCKERSCRIPTPATH"
}

cpp_tools_install() {
	sudo apt update
	echo
	sudo apt install -y \
		gcc gcc-multilib g++ g++-multilib gdb build-essential \
		cppcheck clang-format cmake picocom libgl1-mesa-dev vim \
		bmap-tools sshpass tree git-extras
	echo
	adduser "$USER" dialout
	echo
	git config --global core.editor "vim"
}

btm_tool_install() {
	curl -L https://github.com/ClementTsang/bottom/releases/download/0.5.7/bottom_0.5.7_amd64.deb -o "$BTMINSTALLERPATH"
	sudo dpkg -i "$BTMINSTALLERPATH"
}

batcat_tool_install() {
	curl -L https://github.com/sharkdp/bat/releases/download/v0.18.0/bat_0.18.0_amd64.deb -o "$BATCATINSTALLERPATH"
	sudo dpkg -i "$BATCATINSTALLERPATH"
}

python_nautilus_install() {
	wget -qO- https://raw.githubusercontent.com/cra0zy/code-nautilus/master/install.sh | bash
}

main() {
	setup_color

	clear
	if ! which zsh >/dev/null 2>&1; then
		printf "%sInstall Oh My Zsh? [Y/n]%s " "${YELLOW}" "${RESET}"
		read -r opt
		case $opt in
		y* | Y* | "") zsh_install ;;
		*) ;;
		esac
		exit 0
	fi

	clear
	if which zsh >/dev/null 2>&1; then
		printf "%sInstall Oh My Zsh theme and plugins? [Y/n]%s " "${YELLOW}" "${RESET}"
		read -r opt
		case $opt in
		y* | Y* | "") zsh_theme_plugins_install ;;
		*) ;;
		esac
	fi

	clear
	printf "%sInstall MesloLGS NF font pack? [Y/n]%s " "${YELLOW}" "${RESET}"
	read -r opt
	case $opt in
	y* | Y* | "") meslolgs_font_install ;;
	*) ;;
	esac

	clear
	printf "%sInstall Brave browser? [Y/n]%s " "${YELLOW}" "${RESET}"
	read -r opt
	case $opt in
	y* | Y* | "") brave_browser_install ;;
	*) ;;
	esac

	clear
	printf "%sInstall Tilix terminal? [Y/n]%s " "${YELLOW}" "${RESET}"
	read -r opt
	case $opt in
	y* | Y* | "") tilix_terminal_install ;;
	*) ;;
	esac

	clear
	printf "%sInstall Qt framework? [Y/n]%s " "${YELLOW}" "${RESET}"
	read -r opt
	case $opt in
	y* | Y* | "") qt_install ;;
	*) ;;
	esac

	clear
	printf "%sInstall Docker? [Y/n]%s " "${YELLOW}" "${RESET}"
	read -r opt
	case $opt in
	y* | Y* | "") docker_install ;;
	*) ;;
	esac

	clear
	printf "%sInstall C++ SDK tools? [Y/n]%s " "${YELLOW}" "${RESET}"
	read -r opt
	case $opt in
	y* | Y* | "") cpp_tools_install ;;
	*) ;;
	esac

	clear
	printf "%sInstall bottom (top replacement) tool? [Y/n]%s " "${YELLOW}" "${RESET}"
	read -r opt
	case $opt in
	y* | Y* | "") btm_tool_install ;;
	*) ;;
	esac

	clear
	printf "%sInstall batcat (cat replacement) tool? [Y/n]%s " "${YELLOW}" "${RESET}"
	read -r opt
	case $opt in
	y* | Y* | "") batcat_tool_install ;;
	*) ;;
	esac

	clear
	printf "%sInstall python_nautilus (Nautilus VSCode shortcut) extension? [Y/n]%s " "${YELLOW}" "${RESET}"
	read -r opt
	case $opt in
	y* | Y* | "") python_nautilus_install ;;
	*) ;;
	esac
}

main
