#!/bin/bash
set -e

echo "====================================="
echo "   Installing Sublime Text (Stable)  "
echo "====================================="

# Ensure keyrings directory exists
sudo mkdir -p /etc/apt/keyrings

# Add Sublime Text GPG key
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo tee /etc/apt/keyrings/sublimehq-pub.asc > /dev/null

# Add Sublime Text Stable repository
echo -e 'Types: deb\nURIs: https://download.sublimetext.com/\nSuites: apt/stable/\nSigned-By: /etc/apt/keyrings/sublimehq-pub.asc' | sudo tee /etc/apt/sources.list.d/sublime-text.sources

# Update and install Sublime Text
sudo apt-get update
sudo apt-get install -y sublime-text

echo "====================================="
echo " Sublime Text installation complete! "
echo "====================================="

