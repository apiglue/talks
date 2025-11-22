#!/bin/zsh
echo "Starting Contacts API Contract Testing..."
PRIMS_PROXY_ENDPOINT="http://127.0.0.1:4010"


# Test: Get Contacts    
curl $PRIMS_PROXY_ENDPOINT/contacts > /dev/null

# Test: Get Contact    
curl $PRIMS_PROXY_ENDPOINT/contacts/ed5babcd-f434-4a12-a7df-88d1a5afc17c > /dev/null