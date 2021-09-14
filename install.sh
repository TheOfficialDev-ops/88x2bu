#!/usr/bin/env bash

RED='\033[1;31m'
GREEN='\033[1;32m'
BLUE='\033[1;34m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo "Copyright (c) The Official Dev"
echo "Driver Installer for 88x2bu Wifi Adapter"

echo ""

if [ "$EUID" -ne 0 ] then
    echo "Installer must be run with ROOT permissions (sudo)"
    exit
fi

echo "Updating dependencies..."
echo ""

apt update

echo "Installing packages..."
echo ""

apt install -y dkms git build-essential

echo "Creating driver files..."
echo ""

mkdir /etc/88x2bu-drivers
cd /etc/88x2bu-drivers
git clone https://github.com/morrownr/88x2bu.git
mv 88x2bu src
cd src

echo ""
echo "Installing driver..."
echo ""
./install-driver.sh [NoPrompt]

echo "Driver installed successfully!"
echo "Thanks for choosing The Official Dev Scripts!"
echo ""
echo "Device needs to be rebooted for changes to take effect"
echo "Device will reboot automatically in 10 seconds."
echo "To stop device from be rebooted automatically, Control + C"
echo ""
sleep 10
reboot