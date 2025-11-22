#!/bin/zsh

# WireMock version to download
WIREMOCK_VERSION="3.9.1"
FAKER_EXTENSION_VERSION="0.2.0"

# WireMock JAR filename
WIREMOCK_JAR="wiremock-standalone-${WIREMOCK_VERSION}.jar"
FAKER_JAR="extensions/wiremock-faker-extension-standalone-${FAKER_EXTENSION_VERSION}.jar"

# Maven Central URLs
WIREMOCK_URL="https://repo1.maven.org/maven2/org/wiremock/wiremock-standalone/${WIREMOCK_VERSION}/${WIREMOCK_JAR}"
FAKER_URL="https://repo1.maven.org/maven2/org/wiremock/extensions/wiremock-faker-extension-standalone/${FAKER_EXTENSION_VERSION}/wiremock-faker-extension-standalone-${FAKER_EXTENSION_VERSION}.jar"

# Function to download a file
download_file() {
    local url=$1
    local filename=$2
    
    if command -v curl >/dev/null 2>&1; then
        curl -L -o "${filename}" "${url}"
    elif command -v wget >/dev/null 2>&1; then
        wget -O "${filename}" "${url}"
    else
        echo "Error: Neither curl nor wget is available. Please install one of them."
        return 1
    fi
    return $?
}

echo "Downloading WireMock ${WIREMOCK_VERSION}..."

# Check if the WireMock JAR file already exists
if [ -f "${WIREMOCK_JAR}" ]; then
    echo "WireMock ${WIREMOCK_VERSION} already exists at ${WIREMOCK_JAR}"
else
    # Download the WireMock JAR file
    download_file "${WIREMOCK_URL}" "${WIREMOCK_JAR}"
    
    # Check if download was successful
    if [ $? -eq 0 ] && [ -f "${WIREMOCK_JAR}" ]; then
        echo "Successfully downloaded WireMock ${WIREMOCK_VERSION} to ${WIREMOCK_JAR}"
    else
        echo "Failed to download WireMock ${WIREMOCK_VERSION}"
        exit 1
    fi
fi

echo "Downloading WireMock Faker Extension ${FAKER_EXTENSION_VERSION}..."

# Create extensions directory if it doesn't exist
mkdir -p extensions

# Check if the Faker extension JAR file already exists
if [ -f "${FAKER_JAR}" ]; then
    echo "WireMock Faker Extension ${FAKER_EXTENSION_VERSION} already exists at ${FAKER_JAR}"
else
    # Download the Faker extension JAR file
    download_file "${FAKER_URL}" "${FAKER_JAR}"
    
    # Check if download was successful
    if [ $? -eq 0 ] && [ -f "${FAKER_JAR}" ]; then
        echo "Successfully downloaded WireMock Faker Extension ${FAKER_EXTENSION_VERSION} to ${FAKER_JAR}"
    else
        echo "Failed to download WireMock Faker Extension ${FAKER_EXTENSION_VERSION}"
        exit 1
    fi
fi

echo "All downloads completed successfully!"