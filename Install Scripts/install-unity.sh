#!/bin/bash

set -e

echo "🔧 Installing Unity Hub on Ubuntu..."

# 1. Add Unity GPG key
echo "📥 Adding Unity Hub GPG key..."
wget -qO - https://hub.unity3d.com/linux/keys/public | gpg --dearmor | sudo tee /usr/share/keyrings/Unity_Technologies_ApS.gpg > /dev/null

# 2. Add Unity Hub repository
echo "📦 Adding Unity Hub repository..."
sudo sh -c 'echo "deb [signed-by=/usr/share/keyrings/Unity_Technologies_ApS.gpg] https://hub.unity3d.com/linux/repos/deb stable main" > /etc/apt/sources.list.d/unityhub.list'

# 3. Update packages
echo "🔄 Updating package cache..."
sudo apt update

# 4. Install Unity Hub
echo "🚀 Installing Unity Hub..."
sudo apt install -y unityhub

echo "✅ Unity Hub installation complete!"
echo "Run it using: unityhub"

