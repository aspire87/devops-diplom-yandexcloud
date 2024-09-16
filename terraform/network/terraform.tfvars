###  CLOUD ###
cloud_id = "b1gjmftgjegm4ag26bp3"
folder_id = "b1glbqvicf7rscg13dmp"
default_zone = "ru-central1-a"

### NETWORK ###
network_name = "k8s-network-cluster"

### SUBNETS FOR K8S ###

subnets = {
  "k8s_masters" = [
    {
      name = "k8s_master_zone_a"
      zone = "ru-central1-a"
      cidr = ["10.0.1.0/28"]
    },
    {
      name = "k8s_master_zone_b"
      zone = "ru-central1-b"
      cidr = ["10.0.2.0/28"]
    },
    {
      name = "k8s_master_zone_d"
      zone = "ru-central1-d"
      cidr = ["10.0.3.0/28"]
    }
  ],
  "k8s_workers" = [
    {
      name = "k8s_worker_zone_a"
      zone = "ru-central1-a"
      cidr = ["10.0.4.0/28"]
    },
    {
      name = "k8s_worker_zone_b"
      zone = "ru-central1-b"
      cidr = ["10.0.5.0/28"]
    },
    {
      name = "k8s_worker_zone_d"
      zone = "ru-central1-d"
      cidr = ["10.0.6.0/28"]
    }
  ]
}

### EXTERNAL NETWORK IP###

external_static_ips = {
  ingress_lb = [
    {
      name = "ingress_lb_zone_ru_central1_a"
      zone = "ru-central1-a"
    }
  ]
}

###  IP WHITE LIST ###

white_ips_for_master = ["0.0.0.0/0","95.31.41.55/32"]
