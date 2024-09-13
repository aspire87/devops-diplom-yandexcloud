locals {
  k8s_version = "1.29"
  #sa_name     = "sa-k8s"
  network_output = data.terraform_remote_state.network-terraform.outputs
  worker_subnet_list = zipmap([for subnet in local.network_output.k8s_workers_subnet_info : subnet.zone], [for subnet in local.network_output.k8s_workers_subnet_info : subnet.subnet_id])
}