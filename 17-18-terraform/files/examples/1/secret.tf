resource "kubernetes_secret" "secret-mysql" {
  metadata {
    name = "mysql-secret-tf"
  }

  data = {
    MYSQL_DATABASE = "exampledb"
    MYSQL_USER = "exampleuser"
    MYSQL_PASSWORD = "examplepass"
    MYSQL_ROOT_PASSWORD = "1"
  }

  type = "Opaque"
}