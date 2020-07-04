#!/bin/sh

# qt creator dracula theme
mkdir -p ~/Projects/dracula
git clone https://github.com/dracula/qtcreator.git ~/Projects/dracula/qtcreator || (echo "QtCreator dracula theme clone failed" && exit 1)
mkdir -p ~/.config/QtProject/qtcreator/styles
ln -s ~/Projects/dracula/qtcreator/dracula.xml ~/.config/QtProject/qtcreator/styles/dracula.xml || (echo "Symbolic link creation failed" && exit 1)
