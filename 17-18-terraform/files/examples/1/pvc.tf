resource "kubernetes_persistent_volume_claim" "pvc-mysql" {
    metadata {
        name = "mysql-pvc-tf"
        namespace = kubernetes_namespace.ns-wp.metadata[0].name
        labels = local.labels
    }
    spec {
        access_modes = ["ReadWriteOnce"]
        resources {
            requests = {
                storage = "1Gi"
            }
        }
    }
}

resource "kubernetes_persistent_volume_claim" "pvc-wp" {
    metadata {
        name = "wp-pvc-tf"
        labels = local.labels
        namespace = kubernetes_namespace.ns-wp.metadata[0].name
    }
    spec {
        access_modes = ["ReadWriteOnce"]
        resources {
            requests = {
                storage = "1Gi"
            }
        }
    }
}