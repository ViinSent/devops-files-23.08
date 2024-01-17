resource "kubernetes_persistent_volume_claim" "pvc-mysql" {
    metadata {
        name = "mysql-pvc-tf"
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