#!/bin/bash
# @description This script uninstalls the SAM formatted tool, removing any installed files and configurations.

# Define the installation directory
INSTALL_DIR="/usr/local/bin/sam-formatted"

# Check if the installation directory exists
if [ -d "$INSTALL_DIR" ]; then
  echo "Uninstalling SAM formatted tool..."
  
  # Remove the installation directory
  rm -rf "$INSTALL_DIR"
  
  echo "SAM formatted tool has been uninstalled successfully."
else
  echo "SAM formatted tool is not installed."
fi