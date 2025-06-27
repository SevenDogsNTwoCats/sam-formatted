#!/bin/bash
# This script contains basic tests for the sam-formatted script.

# Test if the script runs without errors
echo "Running basic tests..."

# Test 1: Check if the main script is executable
if [ -x "../bin/sam-formatted.sh" ]; then
  echo "Test 1 Passed: Main script is executable."
else
  echo "Test 1 Failed: Main script is not executable."
  exit 1
fi

# Test 2: Check if help command works
output=$(../bin/sam-formatted.sh --help)
if [[ $output == *"Usage:"* ]]; then
  echo "Test 2 Passed: Help command works."
else
  echo "Test 2 Failed: Help command does not work."
  exit 1
fi

# Test 3: Check if default mode is set correctly
output=$(../bin/sam-formatted.sh)
if [[ $output == *"Mode: api"* ]]; then
  echo "Test 3 Passed: Default mode is set to API."
else
  echo "Test 3 Failed: Default mode is not set to API."
  exit 1
fi

echo "All basic tests completed successfully."