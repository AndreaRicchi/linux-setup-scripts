#!/bin/bash

# Powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k || (echo "Powerlevel10 installation failed" && exit 1)

# Zsh Syntax Highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting  || (echo "zsh-syntax-highlighting installation failed" && exit 1)

# Zsh config
SCRIPT_DIR="$(cd "$(dirname "$0")"; pwd -P)"
ZSHRC_TEMPLATE=${SCRIPT_DIR}/../template/zshrc-template
cp ${ZSHRC_TEMPLATE} ~/.zshrc

# Tilix
sudo apt install tilix  || (echo "Tilix installation failed" && exit 1)

sudo update-alternatives --config x-terminal-emulator  || (echo "Tilix default terminal setup failed" && exit 1)

mkdir -p ~/.config/tilix/schemes
wget https://github.com/clrxbl/tilix-snazzy/raw/master/snazzy.json -O ~/.config/tilix/schemes/snazzy.json  || (echo "Tilix snazzy-theme installation failed" && exit 1)

sudo ln -s /etc/profile.d/vte-2.91.sh /etc/profile.d/vte.sh  || (echo "Tilix links creation failed" && exit 1)
