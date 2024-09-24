resource "yandex_compute_instance" "kube-node" {
  for_each = { for key, value in var.hostname : key => value }
  
  name        = each.value.hostname
  hostname    = each.value.hostname
  platform_id = var.platform
  zone        = var.default_zone
  service_account_id = data.terraform_remote_state.registry-terraform.outputs.sa_id
  resources {
    cores         = var.cpu_cores
    core_fraction = var.cpu_fraction
    memory        = var.ram_size
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.vm-image.id
      type     = var.hdd_type
      size     = var.hdd_size
    }
  }

  scheduling_policy {
    preemptible = var.preemptible
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.k8s-subnet.id
    nat       = var.network_nat
  }

  metadata = {
    serial-port-enable = var.serial_port
    user-data          = data.template_file.cloudinit.rendered
  }

  allow_stopping_for_update = var.stop_to_update
}


resource "yandex_compute_instance" "gitlab" {
  name        = "gitlab-dip"
  hostname    = "gitlab-dip"
  platform_id = var.platform
  zone        = var.default_zone
  service_account_id = data.terraform_remote_state.registry-terraform.outputs.sa_id
  resources {
    cores         = 4
    core_fraction = 100
    memory        = 8
  }

  boot_disk {
    initialize_params {
      image_id = "fd87p9aiv8iscq5ncad8"
      type     = "network-ssd"
      size     = 35
    }
  }

  scheduling_policy {
    preemptible = var.preemptible
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.k8s-subnet.id
    nat       = var.network_nat
  }

  metadata = {
    serial-port-enable = var.serial_port
    user-data          = data.template_file.cloudinit.rendered
  }

  allow_stopping_for_update = var.stop_to_update
}

