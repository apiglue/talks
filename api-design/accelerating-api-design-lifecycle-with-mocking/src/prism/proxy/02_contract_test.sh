#!/bin/zsh
echo "Starting Contacts API Contract Testing..."
PRIMS_PROXY_ENDPOINT="http://127.0.0.1:4010"

# Test: Get Contacts    
echo "Testing: Get Contacts"
curl -s $PRIMS_PROXY_ENDPOINT/contacts > /dev/null

# Test: Get Contact    
echo "Testing: Get Contact"
curl -s $PRIMS_PROXY_ENDPOINT/contacts/ed5babcd-f434-4a12-a7df-88d1a5afc17c > /dev/null