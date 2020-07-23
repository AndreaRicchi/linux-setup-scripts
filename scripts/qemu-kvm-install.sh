#!/bin/bash

if [ "$EUID" -ne 0 ]
	then echo "Please run as root"
	exit
fi

printf "Installing QEMU/KVM... "
apt install qemu-kvm libvirt-clients libvirt-daemon-system bridge-utils \
	libguestfs-tools genisoimage virtinst libosinfo-bin virt-manager -y >/dev/null 2>&1 || { echo "fail"; exit 1; }
adduser "$USER" libvirt >/dev/null 2>&1 || { echo "fail"; exit 1; }
adduser "$USER" libvirt-qemu >/dev/null 2>&1 || { echo "fail"; exit 1; }
echo "done"