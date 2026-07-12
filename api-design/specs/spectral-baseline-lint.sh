#!/bin/zsh

echo "*******"
echo "Linting openapi-non-compliant.json using rulesets/api-design-standards-ruleset.json"
echo "*******"
echo " "


spectral lint --ruleset ../rulesets/api-design-standards-ruleset.json openapi-non-compliant.json