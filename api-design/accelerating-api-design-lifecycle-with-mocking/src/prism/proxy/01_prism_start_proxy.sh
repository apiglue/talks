#!/bin/zsh
echo "Starting Prism Proxy for Contacts API Contract Testing..."

echo "Waking up remote service..."
curl -s https://talks-prism-mock-contacts-api-latest.onrender.com > /dev/null

if [ -z "$HOME_DEV_GH" ]; then
    echo "Error: HOME_DEV_GH environment variable is not set"
    exit 1
fi

SPEC_FILE="contacts-api-contract-testing.json"

if [ ! -f "$SPEC_FILE" ]; then
    echo "Error: OpenAPI spec file not found at $SPEC_FILE"
    exit 1
fi

prism proxy "$SPEC_FILE" https://talks-prism-mock-contacts-api-latest.onrender.com