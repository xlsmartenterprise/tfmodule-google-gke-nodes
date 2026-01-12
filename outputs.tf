# Node Pool Outputs
output "node_pool_name" {
  description = "Name of the node pool"
  value       = google_container_node_pool.default.name
}

output "node_pool_id" {
  description = "ID of the node pool"
  value       = google_container_node_pool.default.id
}

output "node_pool_version" {
  description = "Kubernetes version of the node pool"
  value       = google_container_node_pool.default.version
}
