#!/bin/zsh 
# Generate stubs from OAS file using GenAI

if [ -z "$HOME_DEV_GH" ]; then
    echo "Error: HOME_DEV_GH environment variable is not set"
    exit 1
fi

SPEC_FILE="$HOME_DEV_GH/apiglue/openapi-specs/contacts-api.json"

echo "[BETA] Generating WireMock stubs from OpenAPI spec: $SPEC_FILE"
openapi-generator generate -i "$SPEC_FILE" -g java-wiremock -o ./generated-stubs --additional-properties=packageName=contacts_api_stub,projectName=ContactsAPIStub,packageVersion=1.0.0