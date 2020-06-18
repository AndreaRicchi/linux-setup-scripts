#!/bin/bash

# zsh dracula theme
mkdir -p ~/Projects/dracula
git clone https://github.com/dracula/zsh.git ~/Projects/dracula/zsh || (echo "Zsh dracula theme clone failed" && exit 1)
ln -s ~/Projects/dracula/zsh/dracula.zsh-theme ~/.oh-my-zsh/themes/dracula.zsh-theme || (echo "Symbolic link creation failed" && exit 1)

# syntax highlighting plugin
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting \
    || (echo "Syntax highlighting plugin clone failed" && exit 1)

# zshrc file
SCRIPT_DIR="$(cd "$(dirname "$0")"; pwd -P)"
ZSHRC_TEMPLATE=${SCRIPT_DIR}/../template/zshrc-template
cp ${ZSHRC_TEMPLATE} ~/.zshrc
