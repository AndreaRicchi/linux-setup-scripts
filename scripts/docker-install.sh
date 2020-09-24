#!/bin/bash

if [ "$EUID" -ne 0 ]
    then echo "Please run as root"
    exit
fi

printf "Removing previos version... "
apt remove docker docker-engine docker.io containerd runc -y >/dev/null 2>&1
echo "done"

printf "Installing dependencies... "
apt update >/dev/null 2>&1 || { echo "fail"; exit 1; }
apt-get install apt-transport-https ca-certificates curl \
	gnupg-agent software-properties-common -y >/dev/null 2>&1 || { echo "fail"; exit 1; }
echo "done"

printf "Adding GPG key... "
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - >/dev/null 2>&1 || { echo "fail"; exit 1; }
echo "done"

printf "Adding repository to apt... "
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" \
   >/dev/null 2>&1 || { echo "fail"; exit 1; }
echo "done"

printf "Installing Docker... "
apt update >/dev/null 2>&1 || { echo "fail"; exit 1; }
apt install docker-ce docker-ce-cli containerd.io -y >/dev/null 2>&1 || { echo "fail"; exit 1; }
echo "done"
