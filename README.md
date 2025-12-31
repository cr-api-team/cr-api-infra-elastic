# Elasticsearch Infrastructure

Dedicated repository for managing the Elasticsearch instance in the `cr-api-cluster`.

## Deployment

Changes to `elasticsearch.yaml` and `filebeat.yaml` are automatically deployed via GitHub Actions when pushed to the `main` branch.

### Prerequisites for GitHub Actions
The following secrets must be configured in this repository:
- `GKE_SA_KEY`: Google Cloud Service Account Key with GKE Cluster Viewer/Developer permissions.

## Architecture
- **Elasticsearch:**
  - **Namespace:** `default`
  - **Service Name:** `elasticsearch-service`
  - **Port:** `9200`
- **Filebeat:**
  - **Type:** DaemonSet (runs on all nodes)
  - **Role:** Ships container logs to Elasticsearch.
- **Kibana:**
  - **Service Name:** `kibana`
  - **Port:** `5601`
  - **Role:** Visualization and management dashboard.

## Accessing Kibana

Since Kibana is deployed as a ClusterIP service (internal only), use port-forwarding to access it locally:

```bash
kubectl port-forward service/kibana 5601:5601
```

Then open [http://localhost:5601](http://localhost:5601) in your browser.
Login with user `elastic` and the password from `setup-secrets.ps1`.
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
