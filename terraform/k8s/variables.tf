### CLOUD ###
variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string

  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

### REMOTE STATE ###

variable "k8s_state_key" {
  description = "The key of state for the network."
  type        = string
  default     = null
}

variable "k8s_bucket_name" {
  description = "The name of bucket for the network."
  type        = string
  default     = null
}

### SA ###
variable "service_account_name" {
  type = string
  default = null
}

variable "kms_provider_key_name" {
  type = string
  default = null
}

### K8S CLUSTER ###

variable "cluster_name" {
  description = "Name of a specific Kubernetes cluster."
  type        = string
  default     = null
}

variable "network_policy_provider" {
  description = "Network policy provider for the cluster. Possible values: CALICO."
  type = string
  default = "CALICO"
}

variable "master_version" {
  description = "Version of Kubernetes that will be used for master."
  type = string
  default = null
}

variable "master_public_ip" {
  description = "Boolean flag. When true, Kubernetes master will have a visible ipv4 address."
  type = bool
  default = true
}

variable "master_region" {
  description = "Name of region where cluster will be created. Required for regional cluster, not used for zonal cluster."
  type = string
  default = null
}

### K8S NODE GROUP ###
variable "node_groups" {
  default = {}
}