#!/usr/bin/env bash

RED='\033[1;31m'
GREEN='\033[1;32m'
BLUE='\033[1;34m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo "${BLUE}Copyright (c) The Official Dev${NC}"
echo "${BLUE}Driver Installer for 88x2bu Wifi Adapter${NC}"

echo ""

if [ "$EUID" -ne 0 ]
    then echo "${RED}Installer must be run with ROOT permissions (sudo)${NC}"
    exit
fi

echo "${BLUE}Updating dependencies...${NC}"
echo ""

apt update

echo "${BLUE}Installing packages...${NC}"
echo ""

apt install -y dkms git build-essential

echo "${BLUE}Creating driver files...${NC}"
echo ""

mkdir /etc/88x2bu-drivers
cd /etc/88x2bu-drivers
git clone https://github.com/morrownr/88x2bu.git
mv 88x2bu src
cd src

echo ""
echo "${BLUE}Installing driver...${NC}"
echo ""
./install-driver.sh [NoPrompt]

echo "${BLUE}Driver installed successfully!${NC}"
echo "${BLUE}Thanks for choosing The Official Dev Scripts!${NC}"
echo ""
echo "${BLUE}Device needs to be rebooted for changes to take effect${NC}"
echo "${BLUE}Device will reboot automatically in 10 seconds.${NC}"
echo "${BLUE}To stop device from be rebooted automatically, Control + C${NC}"
echo ""
sleep 10
reboot