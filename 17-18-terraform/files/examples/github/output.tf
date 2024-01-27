data "terraform_remote_state" "wp-state" {
  backend = "kubernetes"
  config = {
    secret_suffix    = "state"
    config_path      = "~/.kube/config_demo"
    namespace = "kube-system"
  }
}

output "full_deatils"{
    value = data.terraform_remote_state.wp-state.outputs
}

output "mysql_ip"{
    value = data.terraform_remote_state.wp-state.outputs.myslq_svc_cluster_ip
}