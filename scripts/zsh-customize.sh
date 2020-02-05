#!/bin/bash

# Powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k || (echo "Powerlevel10 installation failed" && exit 1)

# Zsh Syntax Highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting  || (echo "zsh-syntax-highlighting installation failed" && exit 1)

# Zsh config
SCRIPT_DIR="$(cd "$(dirname "$0")"; pwd -P)"
ZSHRC_TEMPLATE=${SCRIPT_DIR}/../template/zshrc-template
cp ${ZSHRC_TEMPLATE} ~/.zshrc
