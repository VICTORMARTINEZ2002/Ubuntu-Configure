#!/bin/bash
set -e

echo "====================================="
echo "  Installing Visual Studio Code      "
echo "====================================="

# Update package list and install prerequisites
sudo apt update -y
sudo apt install -y wget gpg apt-transport-https software-properties-common

# Add Microsoft GPG key
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
rm -f packages.microsoft.gpg

# Add VS Code repository
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" | sudo tee /etc/apt/sources.list.d/vscode.list

# Update and install VS Code
sudo apt update -y
sudo apt install -y code

echo "====================================="
echo " Visual Studio Code installed!       "
echo " Run with: code                      "
echo "====================================="

