#!/data/data/com.termux/files/usr/bin/bash

# Colors
CYAN='\033[0;36m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

clear
echo -e "${CYAN}==========================================${NC}"
echo -e "${CYAN}    TERMUX DESKTOP AUTO INSTALLER       ${NC}"
echo -e "${CYAN}           by logFC12                   ${NC}"
echo -e "${CYAN}==========================================${NC}"

# Step 1: Choose Display Server
echo -e "\n${YELLOW}[STEP 1] Choose Display Server:${NC}"
echo "1) Termux-X11 (Recommended - Fast/Smooth)"
echo "2) VNC Viewer (Classic)"
read -p "Select choice [1-2]: " display_choice

# Step 2: Choose Desktop Environment
echo -e "\n${YELLOW}[STEP 2] Choose Desktop Environment:${NC}"
echo "1) XFCE4 (Most Stable/Popular)"
echo "2) LXQt (Lightweight)"
read -p "Select choice [1-2]: " de_choice

# Step 3: Choose Theme (Only for XFCE)
if [ "$de_choice" == "1" ]; then
    echo -e "\n${YELLOW}[STEP 3] Choose Theme for XFCE:${NC}"
    echo "1) Greybird (Official XFCE)"
    echo "2) WhiteSur (Mac-ish look)"
    read -p "Select choice [1-2]: " theme_choice
fi

echo -e "\n${GREEN}Starting installation... this might take a while.${NC}"
apt update && apt upgrade -y

# Installing Base Packages
apt install x11-repo -y
apt install pulseaudio termux-api -y

# Installation Logic
if [ "$display_choice" == "1" ]; then
    apt install termux-x11-nightly -y
else
    apt install tigervnc-standalone-server -y
fi

if [ "$de_choice" == "1" ]; then
    apt install xfce4 xfce4-goodies -y
    # Adding Themes if XFCE
    if [ "$theme_choice" == "1" ]; then
        apt install gtk-greybird-theme -y
    fi
else
    apt install lxqt -y
fi

echo -e "\n${GREEN}==========================================${NC}"
echo -e "${GREEN}    INSTALLATION FINISHED!              ${NC}"
echo -e "${GREEN}==========================================${NC}"
echo -e "Follow logFC12 repo for more updates."
