#!/bin/sh

# Oh My Zsh
sudo apt install -y zsh curl || (echo "Zsh/curl installation failed" && exit 1)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" || (echo "Oh My Zsh installation failed" && exit 1)
echo "System reboot is required"
