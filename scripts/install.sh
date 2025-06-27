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

# execute curl -o sam-formatted.sh https://raw.githubusercontent.com/SevenDogsNTwoCats/sam-formatted/main/bin/sam-formatted.sh

curl -o sam-formatted.sh https://raw.githubusercontent.com/SevenDogsNTwoCats/sam-formatted/main/bin/sam-formatted.sh

# Make the script executable
chmod +x sam-formatted.sh


