# ## VARIABLES FOR PROJECT


# variable "cloud_id" {
#   type        = string
#   default     = "b1gjmftgjegm4ag26bp3"
#   description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
# }

# variable "folder_id" {
#   type        = string
#   default     = "b1glbqvicf7rscg13dmp"
#   description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
# }

# variable "default_zone" {
#   type        = string
#   default     = "ru-central1-a"
#   description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
# }

# variable "default_cidr" {
#   type        = list(string)
#   default     = ["10.0.1.0/24"]
#   description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
# }

# variable "default_compute_image" {
#   type        = string
#   default     = "ubuntu-2004-lts"
#   description = "ubuntu-2004-lts"
# }

# variable "default_platform" {
#   type        = string
#   default     = "standard-v2"
#   description = "Platform for VM"
# }


# variable "core_fraction" {
#   type = string
#   description = "Core fraction in percent  5, 20, 100"
#   default = "5"
# }

# variable "default_disk_type" {
#   type = string
#   description = "https://yandex.cloud/ru/docs/compute/concepts/disk"
#   default = "network-hdd"
# }

# variable "preemptible" {
#   type = string
#   description = "https://yandex.cloud/ru/docs/compute/operations/vm-create/create-preemptible-vm"
#   default = "true"
# }

# variable "vpc_name" {
#   type        = string
#   default     = "k8s-cluster"
#   description = "VPC network&subnet name"
# }


# #variable "default_resources" {
# #  type = object({platform=string,disk_type=string,resources=map(number)})
# #  description = "Default min resources"
# #  default = {
# #    resources = {
# #      cores = 2
# #      memory = 1
# #      core_fraction = 5
# #      disk_size = 5
# #    }
# #    platform = "standard-v2"
# #    disk_type = "network-hdd"
# #  }
# #}

