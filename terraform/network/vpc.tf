resource "yandex_vpc_network" "k8s-network-cluster" {
  name = var.network_name
}


resource "yandex_vpc_subnet" "k8s-subnets-cluster" {
  for_each = {
    for k, v in local.subnet_list : "${v.name}" => v
  }
  network_id = yandex_vpc_network.k8s-network-cluster.id
  v4_cidr_blocks = each.value.cidr
  zone           = each.value.zone
  name           = each.value.name
}
# resource "yandex_vpc_subnet" "k8s-network-cluster-a" {
#   v4_cidr_blocks = ["10.1.0.0/16"]
#   zone           = "ru-central1-a"
#   network_id     = yandex_vpc_network.k8s-network-cluster.id
# }

# resource "yandex_vpc_subnet" "k8s-network-cluster-b" {
#   v4_cidr_blocks = ["10.2.0.0/16"]
#   zone           = "ru-central1-b"
#   network_id     = yandex_vpc_network.k8s-network-cluster.id
# }

# resource "yandex_vpc_subnet" "k8s-network-cluster-c" {
#   v4_cidr_blocks = ["10.3.0.0/16"]
#   zone           = "ru-central1-c"
#   network_id     = yandex_vpc_network.k8s-network-cluster.id
# }