#!/bin/bash
set -e

echo "$SF_JWT_KEY" > server.key

sf org login jwt \
  --username "$SF_USERNAME" \
  --jwt-key-file server.key \
  --client-id "$SF_CONSUMER_KEY" \
  --alias DevOrg

echo "Authenticated to Salesforce org."