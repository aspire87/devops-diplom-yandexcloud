## CLOUD VARS ##

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

## NETWORK VARS ##

variable "network_name" {
  description = "The name of main network"
  type        = string
}

### SUBNET VARS ###
variable "subnets" {
  description = "Subnets for k8s-net"

  type = map(list(object(
    {
      name = string,
      zone = string,
      cidr = list(string)
    }))
  )

  validation {
    condition     = alltrue([for i in keys(var.subnets) : alltrue([for j in lookup(var.subnets, i) : contains(["ru-central1-a", "ru-central1-b", "ru-central1-d"], j.zone)])])
    error_message = "Error! Zones  are not supported!"
  }
}

### EXTERNAL NETWORK IP###

variable "external_static_ips" {
  type = map(list(object(
    {
      name = string,
      zone = string
    }))
  )
}

###  IP WHITE LIST ###
variable "white_ips_for_master" {
  type = list(string)
}
