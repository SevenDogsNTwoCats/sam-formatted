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

echo "Installation complete!"

#check if node is installed
if ! command -v node &> /dev/null; then
  echo "Node.js is not installed. Please install Node.js to continue."
  exit 1    
else
  echo "Node.js is installed."
fi

# check if npm is installed
if ! command -v npm &> /dev/null; then
  echo "npm is not installed. Please install Node.js and npm to continue."
  exit 1
else
  echo "npm is installed."  
  # Install npm dependencies
  echo "Installing npm dependencies..."
  npm install --prefix npm
  if [[ $? -ne 0 ]]; then
    echo "Failed to install npm dependencies. Please check the npm logs for more details."
    exit 1
  else
    echo "npm dependencies installed successfully."
  fi
fi

#check if nodemon is installed globally
if ! command -v nodemon &> /dev/null; then
  echo "nodemon is not installed globally. Installing nodemon..."
  npm install -g nodemon
  if [[ $? -ne 0 ]]; then
    echo "Failed to install nodemon. Please check the npm logs for more details."
    exit 1
  else
    echo "nodemon installed successfully."
  fi
else
  echo "nodemon is already installed globally." 
fi

