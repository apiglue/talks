#!/bin/zsh
if [ -z "$HOME_DEV_GH" ]; then
    echo "Error: HOME_DEV_GH environment variable is not set"
    exit 1
fi

SPEC_FILE="$HOME_DEV_GH/apiglue/openapi-specs/contacts-api.json"

echo "Showing differences between local and remote Contacts API OAS..."
oasdiff breaking "$SPEC_FILE" ../oas/drifted-contacts-api.json
