#!/bin/sh

# oh-my-zsh deps
sudo apt install -y zsh git curl git-extras || (echo "Zsh deps installation failed" && exit 1)

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" || (echo "Oh My Zsh installation failed" && exit 1)

