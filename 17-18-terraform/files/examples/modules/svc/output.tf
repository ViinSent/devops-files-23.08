output "cluster_ip" {
  value = kubernetes_service.this.spec.0.cluster_ip
}