#!/bin/bash
# This script uninstalls the sam-formatted tool

# Define the installation path
INSTALL_PATH="/usr/local/bin/sam-formatted"

# Check if the file exists
if [ -f "$INSTALL_PATH" ]; then
  echo "Uninstalling sam-formatted..."
  
  # Request sudo permission to remove the file
  sudo rm "$INSTALL_PATH"
  
  echo "✅ sam-formatted has been uninstalled successfully."
else
  echo "❌ sam-formatted is not installed at $INSTALL_PATH."
fi

# Check for and remove nodemon if installed by this script
if command -v nodemon &> /dev/null; then
  echo "Do you want to uninstall nodemon as well? (y/n)"
  read -r response
  if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]; then
    npm uninstall -g nodemon
    echo "Nodemon has been uninstalled."
  fi
fi

echo "Uninstallation complete."