resource "kubernetes_secret" "secret-mysql" {
  metadata {
    name = "mysql-secret-tf"
    labels = local.labels
    namespace = kubernetes_namespace.ns-wp.metadata[0].name
  }

  data = {
    MYSQL_DATABASE = var.mysql_wp_db_name
    MYSQL_USER = var.mysql_wp_db_user
    MYSQL_PASSWORD = var.mysql_wp_db_password
    MYSQL_ROOT_PASSWORD = "1"
  }

  type = "Opaque"
}