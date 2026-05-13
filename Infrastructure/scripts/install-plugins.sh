#!/bin/bash
set -e

npm install @salesforce/cli --global

echo "Installing sfdx-git-delta plugin..."
echo "y" | sf plugins install sfdx-git-delta@stable

echo "Installing Salesforce Code Analyzer plugin..."
echo "y" | sf plugins install code-analyzer

sf --version
sf plugins