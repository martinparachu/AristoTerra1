variable "credentials" {
  type        = string
  description = "Location of the credentials keyfile."
}

variable "project_id" {
  type        = string
  description = "The project ID to host the cluster in."
}

variable "service_account" {
  type        = string
  description = "The service account to run nodes as if not overridden in node_pools."
}

variable "region" {
  type        = string
  description = "The region to host the cluster in."
}

variable "zones" {
  type        = list(string)
  description = "The zones to host the cluster in."
}

variable "vm_zone" {
  type        = string
  description = "The zone to host the Unity VM."
}

variable "vm_machine_type" {
  type        = string
  description = "Type of the virtual machine."
}

variable "gke_name" {
  type        = string
  description = "The name of the cluster."
}

variable "gke_machine_type" {
  type        = string
  description = "Type of the node compute engines."
}

variable "gke_min_count" {
  type        = number
  description = "Minimum number of nodes in the NodePool. Must be >=0 and <= max_node_count."
}

variable "gke_max_count" {
  type        = number
  description = "Maximum number of nodes in the NodePool. Must be >= min_node_count."
}

variable "gke_disk_size_gb" {
  type        = number
  description = "Size of the node's disk."
}

variable "gke_initial_node_count" {
  type        = number
  description = "The number of nodes to create in this cluster's default node pool."
}