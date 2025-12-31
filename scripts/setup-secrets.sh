#!/bin/bash
# Re-create the elasticsearch-secrets with the correct password
# Password defined in SESSION_HANDOVER.md

kubectl delete secret elasticsearch-secrets --ignore-not-found

kubectl create secret generic elasticsearch-secrets \
  --from-literal=ELASTIC_PASSWORD=cr-api-secure-elastic-2025 \
  --from-literal=ELASTICSEARCH_PASSWORD=cr-api-secure-elastic-2025

echo "Secret 'elasticsearch-secrets' created/updated."
echo "You may need to restart the elasticsearch pod if it was already running."
