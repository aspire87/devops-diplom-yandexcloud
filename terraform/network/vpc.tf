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