#!/data/data/com.termux/files/usr/bin/bash

# Warna
CYAN='\033[0;36m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

clear
echo -e "${CYAN}==========================================${NC}"
echo -e "${CYAN}    TERMUX DESKTOP CUSTOM INSTALLER     ${NC}"
echo -e "${CYAN}           by logFC12                   ${NC}"
echo -e "${CYAN}==========================================${NC}"

# STEP 1: Server
echo -e "\n${YELLOW}[1] Select Display Server:${NC}"
echo "1. Termux-X11 (Smooth/Recommended)"
echo "2. VNC Viewer"
read -p "Choice: " disp_in
[ "$disp_in" == "1" ] && DISP="Termux-X11" || DISP="VNC Viewer"

# STEP 2: DE
echo -e "\n${YELLOW}[2] Select Desktop Environment:${NC}"
echo "1. XFCE4 (Best Support)"
echo "2. LXQt (Ultra Light)"
read -p "Choice: " de_in
[ "$de_in" == "1" ] && DE="XFCE4" || DE="LXQt"

# STEP 3: Theme (Khusus XFCE)
THEME="None"
if [ "$de_in" == "1" ]; then
    echo -e "\n${YELLOW}[3] Select XFCE Theme:${NC}"
    echo "1. Greybird (Official XFCE)"
    echo "2. WhiteSur (MacOS Look)"
    read -p "Choice: " th_in
    [ "$th_in" == "1" ] && THEME="Greybird" || THEME="WhiteSur"
fi

# SUMMARY & CONFIRMATION
clear
echo -e "${YELLOW}--- INSTALLATION SUMMARY ---${NC}"
echo -e "Display Server : ${CYAN}$DISP${NC}"
echo -e "Desktop Env    : ${CYAN}$DE${NC}"
echo -e "Theme          : ${CYAN}$THEME${NC}"
echo -e "${YELLOW}----------------------------${NC}"
read -p "Do you want to proceed with installation? (y/n): " confirm

if [[ ! $confirm =~ ^[Yy]$ ]]; then
    echo -e "${RED}Installation cancelled.${NC}"
    exit 1
fi

echo -e "\n${GREEN}Starting installation... Please wait.${NC}"

# Bagian install mulai di sini
apt update && apt upgrade -y
apt install x11-repo -y

# Logic Install sesuai pilihan
[ "$disp_in" == "1" ] && apt install termux-x11-nightly -y || apt install tigervnc-standalone-server -y

if [ "$de_in" == "1" ]; then
    apt install xfce4 xfce4-goodies -y
    [ "$th_in" == "1" ] && apt install gtk-greybird-theme -y
else
    apt install lxqt -y
fi

echo -e "\n${GREEN}DONE! Tools installed successfully.${NC}"
