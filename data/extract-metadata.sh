#!/bin/bash
ORG="haworth-sdo-lqjsqs"
OUT="$(dirname "$0")"

echo "=== Extracting connections ==="
sf api request rest '/services/data/v65.0/ssot/connections?connectorType=IngestApi' --target-org $ORG 2>/dev/null > "$OUT/connections.json"

echo "=== Extracting data streams ==="
sf api request rest '/services/data/v65.0/ssot/data-streams' --target-org $ORG 2>/dev/null > "$OUT/data-streams.json"

echo "=== Extracting data spaces ==="
sf api request rest '/services/data/v65.0/ssot/data-spaces' --target-org $ORG 2>/dev/null > "$OUT/data-spaces.json"

echo "=== Extracting IDR rulesets ==="
sf api request rest '/services/data/v65.0/ssot/identity-resolutions' --target-org $ORG 2>/dev/null > "$OUT/identity-resolutions.json"

echo "=== Extracting calculated insights ==="
sf api request rest '/services/data/v65.0/ssot/calculated-insights' --target-org $ORG 2>/dev/null > "$OUT/calculated-insights.json"

echo "=== Extracting segments ==="
sf api request rest '/services/data/v65.0/ssot/segments' --target-org $ORG 2>/dev/null > "$OUT/segments.json"

echo "=== Extracting activation targets ==="
sf api request rest '/services/data/v65.0/ssot/activation-targets' --target-org $ORG 2>/dev/null > "$OUT/activation-targets.json"

echo "=== Extracting data action targets ==="
sf api request rest '/services/data/v65.0/ssot/data-action-targets' --target-org $ORG 2>/dev/null > "$OUT/data-action-targets.json"

echo "=== All extractions complete ==="
