#!/bin/bash
set -e

npm install @salesforce/cli --global

echo "Installing sfdx-git-delta plugin..."
echo "y" | sf plugins install sfdx-git-delta@stable

sf --version
sf plugins