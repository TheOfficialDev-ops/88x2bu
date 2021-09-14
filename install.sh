#!/usr/bin/env bash

RED='\033[1;31m'
GREEN='\033[1;32m'
BLUE='\033[1;34m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${BLUE}Copyright (c) The Official Dev${NC}"
echo -e "${BLUE}Driver Installer for 88x2bu Wifi Adapter${NC}"

echo ""

if [ "$EUID" -ne 0 ]
    then echo -e "${RED}Installer must be run with ROOT permissions (sudo)${NC}"
    exit
fi

echo -e "${BLUE}Updating dependencies...${NC}"
echo ""

apt update

echo -e "${BLUE}Installing packages...${NC}"
echo ""

apt install -y dkms git build-essential

echo -e "${BLUE}Creating driver files...${NC}"
echo ""

mkdir /etc/88x2bu-drivers
cd /etc/88x2bu-drivers
git clone https://github.com/morrownr/88x2bu.git
mv 88x2bu src
cd src

echo ""
echo -e "${BLUE}Installing driver...${NC}"
echo ""
./install-driver.sh [NoPrompt]

echo -e "${BLUE}Driver installed successfully!${NC}"
echo -e "${BLUE}Thanks for choosing The Official Dev Scripts!${NC}"
echo ""
echo -e "${BLUE}Device needs to be rebooted for changes to take effect${NC}"
echo -e "${BLUE}Device will reboot automatically in 10 seconds.${NC}"
echo -e "${BLUE}To stop device from be rebooted automatically, Control + C${NC}"
echo ""
sleep 10
reboot