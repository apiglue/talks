#!/bin/zsh

echo "Linting openapi-non-compliant.json"
spectral lint --ruleset ../../../rulesets/api-design-standards-ruleset.json openapi-non-compliant.json
