#!/bin/zsh
echo "Starting WireMock Server with Faker Extension..."
java -cp "wiremock-standalone-3.9.1.jar:extensions/wiremock-faker-extension-standalone-0.2.0.jar" wiremock.Run --port 8081 --verbose --global-response-templating --root-dir ./
