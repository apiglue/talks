#!/bin/zsh
echo "Waking up remote service..."
PRISM_API_URL="https://talks-prism-mock-contacts-api-latest.onrender.com"
WIREMOCK_API_URL="https://talks-mocking-wiremock.onrender.com"

curl -s $PRISM_API_URL > /dev/null
curl -s $WIREMOCK_API_URL > /dev/null
echo "Remote service is awake."