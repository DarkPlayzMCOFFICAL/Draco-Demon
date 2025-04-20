#!/bin/bash
set -e

# Display banner with your name until the Node.js installation
echo ""
echo "===================================="
echo "      Welcome to ItzHimanshuPlayz"
echo "===================================="
echo ""

# Wait for user confirmation
read -p "Do you want to start the installation for Draco Daemon? (y/n): " confirm
if [[ "$confirm" != "y" && "$confirm" != "Y" ]]; then
    echo "Installation cancelled."
    exit 0
fi

# Step 1: Clone Draco-Daemon
echo "Cloning Draco-Daemon..."
git clone https://github.com/draco-labes/draco-daemon
cd draco-daemon
echo "Draco-Daemon cloned and ready."

# Additional setup for Draco-Daemon, if needed
# You can add npm install or configuration steps here if required.
# npm install
# npm run setup

echo "Draco Daemon installation complete!"
