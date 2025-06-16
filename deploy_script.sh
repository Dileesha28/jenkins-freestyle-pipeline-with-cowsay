#!/bin/bash

# Step 1: Install cowsay if not present
if ! command -v cowsay > /dev/null; then
  echo "Installing cowsay..."
  sudo apt-get update && sudo apt-get install -y cowsay
fi

# Step 2: Add cowsay to path
export PATH="$PATH:/usr/games:/usr/local/games"

# Step 3: Validate advice.message exists
if [ ! -f advice.message ]; then
  echo "Error: advice.message not found!"
  exit 1
fi

# Step 4: Read the message
message=$(cat advice.message)

# Step 5: Pick a random cowfile
cowfile=$(ls /usr/share/cowsay/cows | shuf -n 1)

# Step 6: Display message with cowsay
echo "$message" | cowsay -f "$cowfile"
