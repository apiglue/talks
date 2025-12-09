#!/bin/zsh

if [ -z "$HOME_DEV_GH" ]; then
    echo "Error: HOME_DEV_GH environment variable is not set"
    exit 1
fi

SPEC_FILE="$HOME_DEV_GH/apiglue/openapi-specs/contacts-api.json"

prism mock $SPEC_FILE --port 8080 --host 0.0.0.0 -d