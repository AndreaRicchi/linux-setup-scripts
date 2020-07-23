#!/bin/bash

printf "Installing QtCreator Dracula theme... "
mkdir -p ~/Projects/dracula >/dev/null 2>&1 || { echo "fail"; exit 1; }

git clone https://github.com/dracula/qtcreator.git \
	~/Projects/dracula/qtcreator >/dev/null 2>&1 || { echo "fail"; exit 1; }

mkdir -p ~/.config/QtProject/qtcreator/styles >/dev/null 2>&1 || { echo "fail"; exit 1; }

ln -s ~/Projects/dracula/qtcreator/dracula.xml \
	~/.config/QtProject/qtcreator/styles/dracula.xml >/dev/null 2>&1 || { echo "fail"; exit 1; }
echo "done"
