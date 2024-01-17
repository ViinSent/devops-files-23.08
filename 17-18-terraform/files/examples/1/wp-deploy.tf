resource "kubernetes_deployment" "deploy-wp" {
    metadata {
        name = "wp-tf"
    }
    spec {
        replicas = 1
        selector {
            match_labels = {
                app = "wp-tf"
            }
        }
        template {
            metadata {
                labels = {
                    app = "wp-tf"
                }
            }
            spec {
                container {
                    image = "wordpress"
                    name  = "wp"
                    image_pull_policy = "IfNotPresent"
                    env {
                        name = "WORDPRESS_DB_HOST"
                        value = "mysql-tf"
                    }
                    env {
                        name = "WORDPRESS_DB_USER"
                        value_from {
                            secret_key_ref {
                                name = "mysql-secret-tf"
                                key  = "MYSQL_USER"
                            }
                        }
                    }
                    env {
                        name = "WORDPRESS_DB_PASSWORD"
                        value_from {
                            secret_key_ref {
                                name = "mysql-secret-tf"
                                key  = "MYSQL_PASSWORD"
                            }
                        }
                    }
                    env {
                        name = "WORDPRESS_DB_NAME"
                        value_from {
                            secret_key_ref {
                                name = "mysql-secret-tf"
                                key  = "MYSQL_DATABASE"
                            }
                        }
                    }
                    port {
                        container_port = 80
                        protocol       = "TCP"
                    }
                    volume_mount {
                        name       = "wp-data"
                        mount_path = "/var/www/html"
                    }
                }
                volume {
                    name = "wp-data"
                    persistent_volume_claim {
                        claim_name = "wp-pvc-tf"
                    }
                }
            }
        }
    }
}