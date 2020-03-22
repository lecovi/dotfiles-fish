#!/bin/bash

# BASH COLORS
RESET='\e[0m'
RED='\e[31m'
GREEN='\e[32m'
YELLOW='\e[33m'
BOLD_RED='\e[1;31m'
BOLD_GREEN='\e[1;32m'

detect_debian_version () {
    DEBIAN_VERSION=$(cat /etc/debian_version)
    IFS='.' read -ra DEBIAN_VERSION <<< "$DEBIAN_VERSION"
    DEBIAN_VERSION=${DEBIAN_VERSION[0]}
}

detect_linux_distro () {
    # We get which Linux version we are using for setting proper Package Manager
    RELEASE=$(cat /etc/os-release | grep "^ID=")
    IFS='=' read -ra RELEASE <<< "$RELEASE"
    RELEASE=${RELEASE[1]}

    case $RELEASE in
        fedora)
            INSTALL_FISH_CMD='dnf install fish'
            ;;
        manjaro | arch)
            INSTALL_FISH_CMD='pacman -S fish'
            ;;
        debian)
            detect_debian_version
            echo 'deb http://download.opensuse.org/repositories/shells:/fish:/release:/3/Debian_'${DEBIAN_VERSION}'.0/ /' | sudo tee /etc/apt/sources.list.d/shells:fish:release:3.list
            if [ $DEBIAN_VERSION = '9' ]
            then
                wget https://download.opensuse.org/repositories/shells:fish:release:3/Debian_9.0/Release.key -O Release.key
            else
                wget https://download.opensuse.org/repositories/shells:fish:release:3/Debian_10/Release.key -O Release.key
            fi
            sudo apt-key add - < Release.key
            sudo apt update
            INSTALL_FISH_CMD='apt install -y fish'
            ;;
        *)
            echo -e $BOLD_RED"Not supported GNU/Linux distro"$RESET
            exit 1
            ;;
    esac

    echo -e "You are using $BOLD_GREEN'$RELEASE'$RESET GNU/Linux"
}

#TODO: check sudo access
#TODO: check run as normal user


echo -e $YELLOW"Detecting GNU/Linux distro"$RESET
detect_linux_distro

echo -e $YELLOW"Installing FISH the Friendly Interactive Shell"$RESET
sudo $INSTALL_FISH_CMD

echo -e $YELLOW"Setting Fish as default shell, please provide your password"$RESET
chsh -s /usr/bin/fish

echo -e $YELLOW"Customizing FISH"$RESET
#./customize.sh
#echo -e $YELLOW"Installing ssh-agent plugin with Fisherman"$RESET
#fisher install virtualxdriver/ssh-agent.fish.git
#
#echo -e $YELLOW"Installing Kawasaki theme with OMF"$RESET
#omf theme Kawasaki
#
echo -e $BOLD_GREEN"Succesfully installed! Please close this terminal, login again and run 'omf_fisher.sh'"$RESET
