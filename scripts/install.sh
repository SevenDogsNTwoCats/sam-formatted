#!/bin/bash
# This script installs the necessary dependencies and sets up the sam-formatted project.

# Function to display help information
show_help() {
  echo "Usage: ./install.sh [OPTIONS]"
  echo ""
  echo "Options:"
  echo "  --help                 Display this help message"
}

# Check for help option
if [[ "$1" == "--help" ]]; then
  show_help
  exit 0
fi

# Install dependencies (example: jq, awscli)
echo "You need to have jq, nodemon and awscli installed for this script to work properly."
echo "Installing necessary dependencies..."

# Check if jq is installed
if ! command -v jq &> /dev/null; then
  echo "jq is not installed. Installing jq..."
  if [[ "$OSTYPE" == "darwin"* ]]; then
    brew install jq
  else
    sudo apt-get install jq -y
  fi
else
  echo "jq is already installed."
fi

# Check if AWS CLI is installed
if ! command -v aws &> /dev/null; then
  echo "AWS CLI is not installed. Installing AWS CLI..."
  if [[ "$OSTYPE" == "darwin"* ]]; then
    brew install awscli
  else
    sudo apt-get install awscli -y
  fi
else
  echo "AWS CLI is already installed."
fi

# Check if nodemon is installed
if ! command -v nodemon &> /dev/null; then
  echo "nodemon is not installed. Installing nodemon..."
  if [[ "$OSTYPE" == "darwin"* ]]; then
    npm install -g nodemon
  else
    sudo npm install -g nodemon
  fi
else
  echo "nodemon is already installed."
fi

# Download the script
echo "Downloading sam-formatted script..."
curl -o sam-formatted https://raw.githubusercontent.com/SevenDogsNTwoCats/sam-formatted/main/bin/sam-formatted.sh

# Make the script executable
chmod +x sam-formatted

# Install to path
echo "Installing sam-formatted to your system..."
if [[ "$OSTYPE" == "darwin"* ]]; then
  INSTALL_DIR="/usr/local/bin"
else
  INSTALL_DIR="/usr/local/bin"
fi

# Ask for sudo permission to move to bin directory
echo "This step requires sudo permission to install to $INSTALL_DIR"
sudo mv sam-formatted "$INSTALL_DIR/"

echo "✅ Installation complete! You can now run 'sam-formatted' from anywhere."
echo "Try running: sam-formatted --help"