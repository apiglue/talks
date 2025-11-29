#!/bin/zsh
echo "Showing differences between local and remote Contacts API OAS..."
colordiff -u contacts-api-local.json contacts-api-remote.json