# resource "yandex_vpc_network" "k8s-cluster-net" {
#   name = "k8s-cluster-net"
# }

# resource "yandex_vpc_subnet" "k8s-cluster-net-a" {
#   v4_cidr_blocks = ["10.1.0.0/16"]
#   zone           = "ru-central1-a"
#   network_id     = yandex_vpc_network.k8s-cluster-net.id
# }

# resource "yandex_vpc_subnet" "k8s-cluster-net-b" {
#   v4_cidr_blocks = ["10.2.0.0/16"]
#   zone           = "ru-central1-b"
#   network_id     = yandex_vpc_network.k8s-cluster-net.id
# }

# resource "yandex_vpc_subnet" "k8s-cluster-net-c" {
#   v4_cidr_blocks = ["10.3.0.0/16"]
#   zone           = "ru-central1-c"
#   network_id     = yandex_vpc_network.k8s-cluster-net.id
# }

# resource "yandex_iam_service_account" "sa-k8s" {
#   name        = local.sa_name
#   description = "K8S regional service account"
# }

# resource "yandex_resourcemanager_folder_iam_binding" "k8s-clusters-agent" {
#   # Сервисному аккаунту назначается роль "k8s.clusters.agent".
#   folder_id = var.folder_id
#   role      = "k8s.clusters.agent"
#   members = [
#     "serviceAccount:${yandex_iam_service_account.myaccount.id}"
#   ]
# }

# resource "yandex_resourcemanager_folder_iam_binding" "vpc-public-admin" {
#   # Сервисному аккаунту назначается роль "vpc.publicAdmin".
#   folder_id = var.folder_id
#   role      = "vpc.publicAdmin"
#   members = [
#     "serviceAccount:${yandex_iam_service_account.myaccount.id}"
#   ]
# }

# resource "yandex_resourcemanager_folder_iam_binding" "images-puller" {
#   # Сервисному аккаунту назначается роль "container-registry.images.puller".
#   folder_id = var.folder_id
#   role      = "container-registry.images.puller"
#   members = [
#     "serviceAccount:${yandex_iam_service_account.myaccount.id}"
#   ]
# }