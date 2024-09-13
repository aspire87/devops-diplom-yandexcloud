###  CLOUD ###
cloud_id = "b1gjmftgjegm4ag26bp3"
folder_id = "b1glbqvicf7rscg13dmp"
default_zone = "ru-central1-a"


### NETWORK REMOTE STATE ###
k8s_state_key = "k8s-terraform.tfstate"
k8s_bucket_name = "tf-au-net-dip"

### SA ###
service_account_name  = "sa-k8s"
kms_provider_key_name = "kms-key-k8s"


### K8S CLUSTER ###

cluster_name   = "k8s-cluster"
master_version = "1.29"
master_region  = "ru-central1"

### K8S WORKER RESOURCES ###

node_groups = {
  node-group-a = {
    platform_id    = "standard-v2",
    name           = "worker-a-{instance.short_id}",
    cores          = 2,
    memory         = 2,
    core_fraction  = 5,
    boot_disk_type = "network-hdd",
    boot_disk_size = 32,
    zone           = "ru-central1-a",
    preemptible = true,
    auto_scale = {
      min     = 1,
      max     = 3,
      initial = 1
    }
  }
  node-group-b = {
    platform_id    = "standard-v2",
    name           = "worker-b-{instance.short_id}",
    cores          = 2,
    memory         = 2,
    core_fraction  = 5,
    boot_disk_type = "network-hdd",
    boot_disk_size = 32,
    zone           = "ru-central1-b",
    preemptible = true,
    fixed_scale = {
      size     = 1
    }
  }
  node-group-d = {
    platform_id    = "standard-v2",
    name           = "worker-d-{instance.short_id}",
    cores          = 2,
    memory         = 2,
    core_fraction  = 5,
    boot_disk_type = "network-hdd",
    boot_disk_size = 32,
    zone           = "ru-central1-d",
    preemptible = true,
    fixed_scale = {
      size     = 1
    }
  }
}