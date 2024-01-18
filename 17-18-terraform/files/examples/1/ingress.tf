resource "kubernetes_ingress_v1" "ingress_wp" {
    metadata {
        name = "wp-tf"
        labels = local.labels
        namespace = kubernetes_namespace.ns-wp.metadata[0].name
    }
    spec {
        default_backend {
            service {
                name = "wp-tf"
                port {
                    number = 8080
                }
            }
        }
        rule {
            host = "wp.test.local"
            http {
                path {
                    backend {
                        service {
                            name = "wp-tf"
                            port {
                                number = 8080
                            }
                        }
                    }

                    path = "/"
                }
            }
        }
    }
}
