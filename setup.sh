#!/bin/bash

# Colors
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

clear
echo -e "${GREEN}🔥 RMG Termux → Kali Auto Installer 🔥${NC}"
echo ""

# Storage check
echo "[*] Checking storage..."
termux-setup-storage

# Update system
echo "[*] Updating packages..."
pkg update -y && pkg upgrade -y

# Install dependencies
echo "[*] Installing required tools..."
pkg install wget proot git -y

# Menu
echo ""
echo "Select Kali Version:"
echo "1) Full (~6GB)"
echo "2) Minimal (~2GB)"
echo "3) Slim (~1GB)"
echo ""

read -p "Enter choice [1-3]: " choice

# Download installer
echo "[*] Downloading NetHunter installer..."
wget -O install-nethunter-termux https://offs.ec/2MceZWr

chmod +x install-nethunter-termux

# Run installer
case $choice in
    1)
        echo -e "${GREEN}[+] Installing FULL version...${NC}"
        ./install-nethunter-termux
        ;;
    2)
        echo -e "${GREEN}[+] Installing MINIMAL version...${NC}"
        ./install-nethunter-termux -m
        ;;
    3)
        echo -e "${GREEN}[+] Installing SLIM version...${NC}"
        ./install-nethunter-termux -s
        ;;
    *)
        echo -e "${RED}[!] Invalid option${NC}"
        exit 1
        ;;
esac

# Finish
echo ""
echo -e "${GREEN}✅ Installation Complete!${NC}"
echo "Type 'nethunter' to start Kali"
