#!/bin/zsh

echo "Linting openapi-non-compliant-fixed-ruleset.json"
spectral lint --ruleset ../../../rulesets/api-design-standards-ruleset.json openapi-non-compliant-fixed-ruleset.json
