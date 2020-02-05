#!/bin/sh

# Paper icon theme
sudo add-apt-repository -y ppa:snwh/ppa || (echo "Paper repository add failed" && exit 1)
sudo apt update || (echo "Update failed" && exit 1)
sudo apt install -y paper-icon-theme || (echo "Paper-icon installation failed" && exit 1)
