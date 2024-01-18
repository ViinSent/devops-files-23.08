resource "kubernetes_deployment" "deploy-mysql" {
    metadata {
        name = "mysql-tf"
        labels = local.labels
        namespace = kubernetes_namespace.ns-wp.metadata[0].name
    }
    spec {
        replicas = 1
        selector {
            match_labels = {
                app = "mysql-tf"
            }
        }
        template {
            metadata {
                labels = {
                    app = "mysql-tf"
                }
            }
            spec {
                container {
                    image = var.mysql_image
                    name  = "mysql"
                    image_pull_policy = "IfNotPresent"
                    env_from {
                        secret_ref {
                            name = "mysql-secret-tf"
                        }
                    }   
                    port {
                        container_port = 3306
                        protocol       = "TCP"
                    }
                    volume_mount {
                        name       = "mysql-data"
                        mount_path = "/var/lib/mysql"
                    }
                }
                volume {
                    name = "mysql-data"
                    persistent_volume_claim {
                        claim_name = "mysql-pvc-tf"
                    }
                }
            }
        }
    }
}