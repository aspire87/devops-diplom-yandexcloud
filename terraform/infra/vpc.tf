resource "yandex_vpc_network" "k8s-network" {
  name      = var.vpc_name
  folder_id = var.folder_id
}

resource "yandex_vpc_subnet" "k8s-subnet" {
  name           = var.subnet_name
  zone           = var.subnet_zone
  network_id     = yandex_vpc_network.k8s-network.id
  v4_cidr_blocks = var.cidr_block
}
