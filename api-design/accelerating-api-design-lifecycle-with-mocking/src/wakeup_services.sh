#!/bin/zsh
PRISM_API_URL="https://talks-prism-mock-contacts-api-latest.onrender.com/contacts"
WIREMOCK_API_URL="https://talks-mocking-wiremock.onrender.com"

# Render free services spin down after inactivity; a cold start can take 60s+.
# Any HTTP response (even 404) means the container is awake.
wake() {
  local name="$1" url="$2"
  echo "Waking up $name ..."
  for i in {1..30}; do
    code=$(curl -sS -o /dev/null -w "%{http_code}" -L --max-time 120 "$url")
    if [[ -n "$code" && "$code" != "000" ]]; then
      echo "  $name is awake (HTTP $code) after ~$((i*2))s"
      return 0
    fi
    echo "  ... still spinning up ($i)"
    sleep 2
  done
  echo "  WARNING: $name did not respond in time"
  return 1
}

wake "Prism"    "$PRISM_API_URL"
wake "WireMock" "$WIREMOCK_API_URL"