#!/bin/bash

if [ "$EUID" -ne 0 ]
	then echo "Please run as root"
	exit
fi

printf "Installing dependecies... "
apt install apt-transport-https curl -y >/dev/null 2>&1 || { echo "fail"; exit 1; }
echo "done"

printf "Adding repository to apt... "
curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc \
	| sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add - >/dev/null 2>&1 || { echo "fail"; exit 1; }
echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" \
	| sudo tee /etc/apt/sources.list.d/brave-browser-release.list >/dev/null 2>&1 || { echo "fail"; exit 1; }
echo "done"

printf "Installing Brave... "
apt update >/dev/null 2>&1 || { echo "fail"; exit 1; }
apt install brave-browser -y >/dev/null 2>&1  || { echo "fail"; exit 1; }
echo "done"