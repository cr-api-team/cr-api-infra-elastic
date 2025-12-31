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
- **Configuration:** Single-node, security **ENABLED**.
  - Authentication handled via `elasticsearch-secrets`.
  - Default password: `cr-api-secure-elastic-2025` (managed via scripts).

## Setup

Before deploying, ensure the secrets are created in the cluster:

**PowerShell:**
```powershell
.\scripts\setup-secrets.ps1
```

**Bash:**
```bash
./scripts/setup-secrets.sh
```
