# tfmodule-google-gke-nodepool

Terraform module for creating and managing Google Kubernetes Engine (GKE) node pools with customizable compute resources, auto-upgrade, auto-repair, and tagging capabilities.

## Features

- **Flexible node pool configuration** with customizable machine types and disk sizes
- **Advanced upgrade settings** with support for surge and blue-green deployment strategies
- **Blue-green deployments** for zero-downtime node pool upgrades
- **Auto-upgrade management** for automated Kubernetes version updates
- **Auto-repair capabilities** for automatic node health maintenance
- **Custom service account** support for fine-grained IAM permissions
- **Network tags** for firewall rule targeting and network segmentation
- **Node labels** for Kubernetes workload scheduling and organization
- **Resource manager tags** for organization-level resource management
- **Configurable node count** per zone for workload scaling
- **Multiple image types** support (COS, Ubuntu, Windows)
- **Full OAuth scopes** for Google Cloud API access

## Usage

### Basic Example

```hcl
module "gke_node_pool" {
  source = "github.com/xlsmartenterprise/tfmodule-google-gke-nodepool"

  # Project and Location
  project_id   = "my-gcp-project"
  region       = "us-central1"
  cluster_name = "production-gke"
  
  # Node Pool Configuration
  node_pool_name = "general-purpose-pool"
  node_count     = 3
  
  # Node Configuration
  image_type   = "COS_CONTAINERD"
  machine_type = "e2-standard-4"
  disk_size    = 100
  
  # Service Account
  service_account = "gke-nodes@my-gcp-project.iam.gserviceaccount.com"
  
  # Network Tags
  tags = [
    "gke-node",
    "allow-health-check"
  ]
  
  # Management
  enable_auto_upgrade = true
  enable_auto_repair  = true
  
  # Resource Tags
  resource_manager_tags = {}
}
```

### Node Pool with Blue-Green Upgrade Strategy

```hcl
module "gke_bluegreen_pool" {
  source = "github.com/xlsmartenterprise/tfmodule-google-gke-nodepool"

  project_id   = "my-gcp-project"
  region       = "us-central1"
  cluster_name = "production-gke"
  
  node_pool_name = "bluegreen-pool"
  node_count     = 3
  
  image_type   = "COS_CONTAINERD"
  machine_type = "n2-standard-4"
  disk_size    = 100
  
  service_account = "gke-nodes@my-gcp-project.iam.gserviceaccount.com"
  
  tags = ["gke-node"]
  
  labels = {
    "environment" = "production"
    "team"        = "platform"
  }
  
  enable_auto_upgrade = true
  enable_auto_repair  = true
  
  # Blue-Green Upgrade Settings
  strategy        = "BLUE_GREEN"
  max_surge       = 3
  max_unavailable = 0
  
  blue_green_settings = {
    batch_percentage        = 0.33
    batch_soak_duration     = "3600s"
    node_pool_soak_duration = "7200s"
  }
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| project_id | GCP Project ID | `string` | n/a | yes |
| region | GCP region for the cluster | `string` | n/a | yes |
| cluster_name | Name of the GKE cluster | `string` | n/a | yes |
| node_pool_name | Name of the node pool | `string` | n/a | yes |
| node_count | Number of nodes per zone | `number` | n/a | yes |
| image_type | Node image type | `string` | n/a | yes |
| machine_type | Machine type for nodes | `string` | n/a | yes |
| disk_size | Disk size in GB for nodes | `number` | n/a | yes |
| service_account | Service account for nodes | `string` | n/a | yes |
| tags | Network tags for nodes | `list(string)` | n/a | yes |
| enable_auto_upgrade | Enable auto upgrade for node pool | `bool` | n/a | yes |
| enable_auto_repair | Enable auto repair for node pool | `bool` | n/a | yes |
| labels | Labels to apply to nodes | `map(string)` | `{}` | no |
| max_surge | The number of additional nodes that can be added to the node pool during an upgrade | `number` | `1` | no |
| max_unavailable | The number of nodes that can be simultaneously unavailable during an upgrade | `number` | `0` | no |
| strategy | The upgrade strategy to be used for upgrading the nodes. Valid values: SURGE, BLUE_GREEN | `string` | `"SURGE"` | no |
| blue_green_settings | Settings for blue-green upgrade strategy with standard rollout policy | `object` | `null` | no |
| resource_manager_tags | Resource manager tags to apply to the GKE cluster. Map of tag key to tag value ID | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| node_pool_name | Name of the node pool |
| node_pool_id | ID of the node pool |
| node_pool_version | Kubernetes version of the node pool |

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.5.0 |
| google | >= 7.0.0, < 8.0.0 |
| google-beta | >= 7.0.0, < 8.0.0 |

## Changelog

See [CHANGELOG.md](./CHANGELOG.md) for version history and changes.