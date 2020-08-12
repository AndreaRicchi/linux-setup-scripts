#!/bin/bash

if [ "$EUID" -ne 0 ]
        then echo "Please run as root"
        exit
fi

printf "Installing compilers... "
apt install gcc gcc-multilib g++ g++-multilib gdb build-essential -y >/dev/null 2>&1 || { echo "fail"; exit 1; }
echo "done"

printf "Installing C++ tools... "
apt install cppcheck clang-format cmake -y >/dev/null 2>&1 || { echo "fail"; exit 1; }
echo "done"

read -p "Install GCC 7? [y/N]" -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
	printf "Installing compilers... "
	apt install gcc-7 gcc-7-multilib g++-7 g++-7-multilib -y >/dev/null 2>&1 || { echo "fail"; exit 1; }
	echo "done"
fi
