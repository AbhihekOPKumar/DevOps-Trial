#!/bin/bash
set -e

echo "Running Salesforce Code Analyzer..."

sf scanner run \
  --target "force-app" \
  --format table \
  --severity-threshold 3

echo "Code analysis completed."