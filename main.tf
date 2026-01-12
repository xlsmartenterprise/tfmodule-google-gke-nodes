# Create a Node Pool
resource "google_container_node_pool" "default" {
  name       = var.node_pool_name
  cluster    = var.cluster_name
  location   = var.region
  project    = var.project_id
  node_count = var.node_count

  node_config {
    image_type      = var.image_type
    machine_type    = var.machine_type
    disk_size_gb    = var.disk_size
    service_account = var.service_account
    tags            = var.tags
    labels          = var.labels
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
    resource_manager_tags = var.resource_manager_tags
    metadata              = var.metadata
  }

  management {
    auto_upgrade = var.enable_auto_upgrade
    auto_repair  = var.enable_auto_repair
  }

  upgrade_settings {
    max_surge       = var.max_surge
    max_unavailable = var.max_unavailable
    strategy        = var.strategy

    dynamic "blue_green_settings" {
      for_each = var.blue_green_settings != null ? [var.blue_green_settings] : []
      content {
        node_pool_soak_duration = blue_green_settings.value.node_pool_soak_duration

        standard_rollout_policy {
          batch_percentage    = blue_green_settings.value.batch_percentage
          batch_node_count    = blue_green_settings.value.batch_node_count
          batch_soak_duration = blue_green_settings.value.batch_soak_duration
        }
      }
    }
  }
}
