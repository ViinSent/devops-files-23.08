module "svc-mysql" {
  source = "../modules/svc"

  svc_name = "mysql-tf"
  svc_labels = local.labels
  svc_namespace = kubernetes_namespace.ns-wp.metadata[0].name
  
  svc_selector = {
    app = "mysql"
  }
  svc_port = var.mysql_port
  svc_target_port = var.mysql_port
  svc_type = "ClusterIP"

}

module "svc-wp" {
  source = "../modules/svc"

  svc_name = "wp-tf"
  svc_labels = local.labels
  svc_namespace = kubernetes_namespace.ns-wp.metadata[0].name
  
  svc_selector = {
    app = "wp"
  }
  svc_port = var.wp_svc_port
  svc_target_port = var.wp_container_port
  svc_type = "ClusterIP"

}
