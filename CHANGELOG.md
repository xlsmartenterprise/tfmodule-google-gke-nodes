# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [v1.0.0] - 2026-01-12

### Added

#### Core Node Pool Features
- Initial release of GKE node pool Terraform module
- Support for creating managed node pools in existing GKE clusters
- Configurable node pool naming for better organization
- Per-zone node count configuration for flexible scaling
- Integration with parent GKE cluster via cluster name reference

#### Node Configuration
- **Image type selection** with support for multiple operating systems:
  - Container-Optimized OS (COS) with containerd runtime
  - Container-Optimized OS (COS) with Docker runtime
  - Ubuntu with containerd runtime
  - Ubuntu with Docker runtime
  - Windows Server LTSC and SAC variants
- **Machine type configuration** supporting full range of Google Cloud machine types:
  - General purpose (E2, N2, N1)
  - Compute-optimized (C2)
  - Memory-optimized (N2-highmem, M1, M2)
  - GPU-enabled instance types
- **Disk size configuration** with customizable boot disk size in GB
- **Service account assignment** for fine-grained IAM permissions
- **Network tags** support for firewall and network policy targeting
- **Node labels** support for Kubernetes node labeling and workload scheduling
- **Full OAuth scope** (`cloud-platform`) for comprehensive Google Cloud API access

#### Upgrade Settings
- **Upgrade strategy configuration** with support for SURGE and BLUE_GREEN strategies
- **Max surge** setting to control additional nodes during upgrades
- **Max unavailable** setting to control parallel node upgrades
- **Blue-green deployment** support for zero-downtime upgrades:
  - Standard rollout policy with batch-based upgrades
    - Configurable batch percentage for controlled rollouts
    - Batch node count for precise upgrade control
    - Batch soak duration for stability verification
  - Node pool soak duration for post-upgrade validation

#### Node Pool Management
- **Auto-upgrade capability** for automated Kubernetes version updates
  - Automatically updates nodes to match cluster master version
  - Configurable enable/disable option for change control requirements
- **Auto-repair functionality** for automatic node health maintenance
  - Automatically detects and repairs unhealthy nodes
  - Recreates failed nodes to maintain desired node count
  - Configurable enable/disable option

#### Resource Organization
- **Resource manager tags** support for organization-level resource management
  - Tag-based resource organization and filtering
  - Support for conditional IAM policies
  - Cost allocation and tracking capabilities
  - Compliance and governance policy enforcement
- Default empty map for optional tag assignment