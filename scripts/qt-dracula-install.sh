#!/bin/sh

mkdir -p ~/Projects/rcc/
git clone https://github.com/dracula/qtcreator.git ~/Projects/rcc/qt-dracula-theme
mkdir -p ~/.config/QtProject/qtcreator/styles
cp ~/Projects/rcc/qt-dracula-theme/dracula.xml ~/.config/QtProject/qtcreator/styles
