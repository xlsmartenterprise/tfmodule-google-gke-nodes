variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "region" {
  description = "GCP region for the cluster"
  type        = string
}

variable "cluster_name" {
  description = "Name of the GKE cluster"
  type        = string
}

# Node Pool Variables
variable "node_pool_name" {
  description = "Name of the node pool"
  type        = string
}

variable "node_count" {
  description = "Number of nodes per zone"
  type        = number
}

variable "image_type" {
  description = "Node image type"
  type        = string
}

variable "machine_type" {
  description = "Machine type for nodes"
  type        = string
}

variable "disk_size" {
  description = "Disk size in GB for nodes"
  type        = number
}

variable "service_account" {
  description = "Service account for nodes"
  type        = string
}

variable "tags" {
  description = "Network tags for nodes"
  type        = list(string)
}

variable "labels" {
  description = "The Kubernetes labels (key/value pairs) to be applied to each node"
  type        = map(string)
  default     = {}
}

variable "enable_auto_upgrade" {
  description = "Enable auto upgrade for node pool"
  type        = bool
}

variable "enable_auto_repair" {
  description = "Enable auto repair for node pool"
  type        = bool
}

variable "resource_manager_tags" {
  description = "Resource manager tags to apply to the GKE cluster. Map of tag key to tag value ID"
  type        = map(string)
  default     = {}
}

variable "metadata" {
  description = "Instance metadata key/value pairs for nodes"
  type        = map(string)
  default     = {}
}

# Upgrade Settings Variables
variable "max_surge" {
  description = "The number of additional nodes that can be added to the node pool during an upgrade. Increasing max_surge raises the number of nodes that can be upgraded simultaneously"
  type        = number
  default     = 1
}

variable "max_unavailable" {
  description = "The number of nodes that can be simultaneously unavailable during an upgrade. Increasing max_unavailable raises the number of nodes that can be upgraded in parallel"
  type        = number
  default     = 0
}

variable "strategy" {
  description = "The upgrade strategy to be used for upgrading the nodes. Valid values: SURGE, BLUE_GREEN"
  type        = string
  default     = "SURGE"
}

variable "blue_green_settings" {
  description = "Settings for blue-green upgrade strategy with standard rollout policy"
  type = object({
    batch_percentage        = optional(number)
    batch_node_count        = optional(number)
    batch_soak_duration     = optional(string)
    node_pool_soak_duration = optional(string)
  })
  default = null
}
