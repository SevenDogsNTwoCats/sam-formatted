#!/bin/bash
set -e

INSTALL_DIR="/usr/local/bin"
SCRIPT_NAME="sam-formatted"

echo "Installing $SCRIPT_NAME..."

# Download the script
curl -s -o "$INSTALL_DIR/$SCRIPT_NAME" https://raw.githubusercontent.com/SevenDogsNTwoCats/sam-formatted/main/run-sam-formatted.sh

# Make it executable
chmod +x "$INSTALL_DIR/$SCRIPT_NAME"

echo "$SCRIPT_NAME has been installed to $INSTALL_DIR"
echo "You can now run it using: $SCRIPT_NAME"