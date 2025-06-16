#!/bin/bash

# Ensure jq is installed

if ! command -v jq > /dev/null; then
  echo "jq not found. Installing..."
  sudo apt-get update && sudo apt-get install -y jq
fi


# Validate advice.json exists
if [ ! -f advice.json ]; then
  echo "Error: advice.json not found!"
  exit 1
fi

echo "Extracting message from advice.json..."

# Extract message
message=$(jq -r '.advice.message' advice.json)

# Validate the message
if [ -z "$message" ] || [ "$message" == "null" ]; then
  echo "Test Failed: No message found in advice.json"
  exit 1
fi

# Save message to advice.message
echo "$message" > advice.message
echo "Test Passed: Message written to advice.message"
