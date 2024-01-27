resource "kubernetes_namespace" "ns-wp" {
    metadata {
        name = "${local.prefix}-ns"
        labels = local.labels
    }
}