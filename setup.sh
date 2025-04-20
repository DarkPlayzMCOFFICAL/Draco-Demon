#!/bin/bash
set -e

echo ""
echo "===================================="
echo "      Welcome to Dark_Playz_MC"
echo "===================================="
echo ""

# Confirm install
read -p "Do you want to start the installation for Draco Daemon? (y/n): " confirm
if [[ "$confirm" != "y" && "$confirm" != "Y" ]]; then
    echo "Installation cancelled."
    exit 0
fi

# Clone repo
echo "Cloning Draco-Daemon..."
git clone https://github.com/draco-labes/draco-daemon
cd draco-daemon
echo "Draco-Daemon cloned and ready."

# Install dependencies
echo "Installing dependencies..."
npm install

# Run seed script
echo "Seeding image data..."
node exec/seed.js

# Create admin user
echo "Creating admin user..."
node exec/createUser.js

echo "✅ Draco Daemon installation and setup complete!"
