#!/bin/bash
set -e

# Display banner with your name until the Node.js installation
echo ""
echo "===================================="
echo "      Welcome to I    Dark_Playz_MC"
echo "===================================="
echo ""

# Wait for user confirmation
read -p "Do you want to start the installation for Draco Panel? (y/n): " confirm
if [[ "$confirm" != "y" && "$confirm" != "Y" ]]; then
    echo "Installation cancelled."
    exit 0
fi

# Installation begins here — Displaying your name first
echo "Installation will begin soon... Let's install Node.js!"

# Step 1: Node.js setup (Installation begins after this point)
curl -sL https://deb.nodesource.com/setup_20.x | sudo bash -
sudo apt-get install nodejs -y

# After installing Node.js, show full installation steps
echo "Node.js installation completed. Now proceeding with the Draco Panel installation..."

# Step 2: Clone and setup Draco Panel
git clone https://github.com/draco-labes/panel-v1.0.0.git
cd panel-v1.0.0
npm install
npm run seed
npm run createUser
node .

echo "Draco Panel installation complete!"
