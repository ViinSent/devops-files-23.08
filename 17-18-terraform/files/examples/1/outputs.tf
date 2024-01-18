output "myslq_svc_cluster_ip" {
    value = module.svc-mysql.cluster_ip
}

output "wp_svc_cluster_ip" {
    sensitive = true
    value = module.svc-wp.cluster_ip
}