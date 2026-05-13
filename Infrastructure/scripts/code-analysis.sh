#!/bin/bash
set -e

echo "Generating delta package..."

sf sgd source delta \
  --to "HEAD" \
  --from "HEAD^" \
  --output .

echo "Generated package.xml:"
cat package/package.xml || true

echo "Generated destructiveChanges.xml:"
cat destructiveChanges/destructiveChanges.xml || true

if grep -q "<types>" package/package.xml; then
  echo "Metadata changes found. Running validation..."

  sf project deploy start \
    --manifest package/package.xml \
    --post-destructive-changes destructiveChanges/destructiveChanges.xml \
    --target-org DevOrg \
    --test-level RunLocalTests \
    --dry-run \
    --wait 120 \
    --verbose
else
  echo "No metadata changes found. Skipping validation."
fi