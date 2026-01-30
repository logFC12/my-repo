#!/data/data/com.termux/files/usr/bin/bash

# Warna-warna biar keren
CYAN='\033[0;36m'
GREEN='\033[0;32m'
NC='\033[0m'

echo -e "${CYAN}--- Installing logFC12 Repository ---${NC}"

# Tambahin repo ke sources.list.d
echo "deb [trusted=yes] https://logfc12.github.io/my-repo/ ./" > $PREFIX/etc/apt/sources.list.d/myrepo.list

# Update database paket
echo -e "${CYAN}Updating package list...${NC}"
apt update

echo -e "${GREEN}Repo berhasil dipasang! Sekarang lo bisa install tools gue.${NC}"
echo -e "Contoh: ${CYAN}pkg install nitepad${NC} atau ${CYAN}pkg install afb${NC}"
