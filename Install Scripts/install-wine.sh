#!/bin/bash
set -e

echo "====================================="
echo "         Installing Wine             "
echo "====================================="

# Enable 32-bit architecture
sudo dpkg --add-architecture i386

# Detect Ubuntu codename
CODENAME=$(grep '^UBUNTU_CODENAME=' /etc/os-release | cut -d= -f2)
echo "Detected Ubuntu codename: $CODENAME"

# Create keyrings folder
sudo mkdir -pm755 /etc/apt/keyrings

# Add WineHQ GPG key
wget -O- https://dl.winehq.org/wine-builds/winehq.key | sudo gpg --dearmor -o /etc/apt/keyrings/winehq-archive.key

# Add Wine repository based on codename
case $CODENAME in
    jammy)
        sudo wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/ubuntu/dists/focal/winehq-focal.sources
        ;;
    noble)
        sudo wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/ubuntu/dists/noble/winehq-noble.sources
        ;;
    plucky)
        sudo wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/ubuntu/dists/plucky/winehq-plucky.sources
        ;;
    *)
        echo "Your Ubuntu version ($CODENAME) may require manual repository selection."
        exit 1
        ;;
esac

# Update packages
sudo apt update -y

# Install Wine stable
sudo apt install --install-recommends -y winehq-stable

echo "====================================="
echo "        Wine installation done       "
echo "====================================="

# Show Wine version
wine --version

