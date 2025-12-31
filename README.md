# Elasticsearch Infrastructure

Dedicated repository for managing the Elasticsearch instance in the `cr-api-cluster`.

## Deployment

Changes to `elasticsearch.yaml` are automatically deployed via GitHub Actions when pushed to the `main` branch.

### Prerequisites for GitHub Actions
The following secrets must be configured in this repository:
- `GKE_SA_KEY`: Google Cloud Service Account Key with GKE Cluster Viewer/Developer permissions.

## Architecture
- **Namespace:** `default`
- **Service Name:** `elasticsearch-service`
- **Port:** `9200`
- **Configuration:** Single-node, security disabled (for internal dev cluster use).
