#!/bin/bash
set -e

echo "====================================="
echo "   Installing FULL LaTeX (texlive)   "
echo "====================================="

# Update package list
sudo apt update -y

# Install full LaTeX (all packages, ~5GB)
sudo apt install texlive-full -y

echo "====================================="
echo " LaTeX Full installation completed!  "
echo "====================================="

