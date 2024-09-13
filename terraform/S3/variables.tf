## CLOUD ###
variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type = string

  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

### REMOTE STATE ###

variable "s3_state_key" {
  description = "The key of state for the network."
  type        = string
  default     = null
}

variable "s3_bucket_name" {
  description = "The name of bucket for the network."
  type        = string
  default     = null
}

### SA ###
variable "service_account_name" {
  type    = string
  default = null
}

#variable "kms_provider_key_name" {
#  type = string
#  default = null
#}
