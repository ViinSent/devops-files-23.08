resource "kubernetes_service" "svc-wp" {
  metadata {
    name = "wp-tf"
  }
  spec {
    selector = {
      app = "wp"
    }
    port {
      port        = 8080
      target_port = 80
    }
    type = "ClusterIP"
  }
}

resource "kubernetes_service" "svc-mysql" {
  metadata {
    name = "mysql-tf"
  }
  spec {
    selector = {
      app = "mysql"
    }
    port {
      port        = 3306
      target_port = 3306
    }
    type = "ClusterIP"
  }
}