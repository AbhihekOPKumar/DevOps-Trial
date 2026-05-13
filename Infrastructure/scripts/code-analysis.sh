#!/bin/bash
set -e

echo "Running Salesforce Code Analyzer..."

sf code-analyzer run \
  --target "force-app" \
  --view table

echo "Code analysis completed."