#!/bin/zsh

echo "Starting Prism Proxy for Contacts API Contract Testing..."

echo "Waking up remote service..."

API_URL="https://talks-prism-mock-contacts-api-latest.onrender.com"
WIREMOCK_JAR="wiremock-standalone-3.9.1.jar"

# Check if WireMock JAR file exists
if [ ! -f "$WIREMOCK_JAR" ]; then
    echo "Error: WireMock JAR file '$WIREMOCK_JAR' not found!"
    echo "Please download it first or run get_wiremock.sh"
    exit 1
fi

curl -s $API_URL > /dev/null

# Start WireMock in recording mode
java -jar $WIREMOCK_JAR --proxy-all="$API_URL" --record-mappings --verbose