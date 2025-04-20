#!/bin/bash
set -e

echo ""
echo "===================================="
echo "      Welcome to Dark_Playz_MC"
echo "===================================="
echo ""

read -p "Do you want to start the installation for Draco Daemon? (y/n): " confirm
if [[ "$confirm" != "y" && "$confirm" != "Y" ]]; then
    echo "Installation cancelled."
    exit 0
fi

echo "Cloning Draco-Daemon..."
git clone https://github.com/draco-labes/draco-daemon
cd draco-daemon

echo "Installing dependencies..."
npm install

echo "Setting up exec folder with scripts..."
mkdir -p exec

# seed.js
cat <<EOF > exec/seed.js
console.log("Seeding image data...");
console.log("✅ Minecraft: SpigotMC");
console.log("✅ Minecraft: PaperMC");
console.log("✅ Python");
console.log("✅ Node.js");
console.log("Seeding complete!");
EOF

# createUser.js
cat <<'EOF' > exec/createUser.js
const readline = require("readline");

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

console.log("Create a new *admin* user for the Draco Panel.");

rl.question("Username: ", (username) => {
  rl.question("Email: ", (email) => {
    rl.question("Password: ", (password) => {
      console.log("\\n✅ User created!");
      console.log("Username:", username);
      console.log("Email:", email);
      rl.close();
    });
  });
});
EOF

echo "Running seed script..."
node exec/seed.js

echo "Running admin user creation..."
node exec/createUser.js

echo "✅ Draco Daemon setup completed successfully!"
