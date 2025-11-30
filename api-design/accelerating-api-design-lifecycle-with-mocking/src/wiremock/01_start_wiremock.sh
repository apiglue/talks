#!/bin/zsh

# WireMock versions
WIREMOCK_VERSION="3.9.1"
FAKER_EXTENSION_VERSION="0.2.0"

echo "Starting WireMock Server with Faker Extension..."
java -cp "wiremock-standalone-$WIREMOCK_VERSION.jar:extensions/wiremock-faker-extension-standalone-$FAKER_EXTENSION_VERSION.jar" wiremock.Run --port 8081 --verbose --global-response-templating --root-dir ./
