
#!/bin/bash

# Create advice.json with a message object
echo "Generating advice.json..."
cat <<EOF > advice.json
{
  "advice": {
    "message": "Write code as if the next person to maintain it is a violent psychopath who knows where you live."
  }
}
EOF

echo "advice.json created:"
cat advice.json
