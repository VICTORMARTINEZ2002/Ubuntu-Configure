#!/bin/bash
set -e

echo "====================================="
echo "        Instalando Apt/snap          "
echo "====================================="

# Atualizar pacotes
sudo apt update -y

# Instalar Apps (Ubuntu Rep. Oficial)
sudo apt install -y git
sudo apt install -y vlc
sudo apt install -y gimp
sudo apt install -y gufw       # Firewall
sudo apt install -y dosbox
sudo apt install -y blender
sudo apt install -y preload    # Fast Lauch using RAM preload
sudo apt install -y timeshift  # Backups
sudo apt install -y bleachbit  # Memory Limpeza
sudo apt install -y obs-studio

# GNOME
sudo apt install -y gnome-boxes  # Virtualização
sudo apt install -y gnome-tweaks # Configuraçõe
sudo apt-get install -y gnome-browser-connector

# Ubuntu Extras
sudo apt install -y ubuntu-restricted-extras

# DEV
sudo apt install -y build-essential # GCC,G++,Make

# Instalar snapd
sudo apt install -y snapd      # Necessário
sudo snap install tex-match

# FINAL
sudo apt update
sudo apt upgrade -y
sudo apt autoremove

echo "====================================="
echo "       Instalação Concluída          "
echo "====================================="
