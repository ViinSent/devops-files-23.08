resource "local_file" "ansible_inventory" {
  content = templatefile("ansible_inv.tpl",
    {
      vm_ip_address = data.terraform_remote_state.wp-state.outputs.myslq_svc_cluster_ip,
      private_ssh_key = "~/.ssh/id_rsa"
    }
  )
  filename = "./inventory"
}

# resource "null_resource" "ansible" {
#   provisioner "local-exec" {
#     command = "ansible-playbook -i inventory playbook.yml"
#   }
#   depends_on = [local_file.ansible_inventory]
# }

resource "null_resource" "docker_build" {
  provisioner "local-exec" {
    command = "echo docker build"
    # command = <<-EOF
    #   echo ${var.tf_token} | docker login -u fenikks ghcr.io --password-stdin
    #   docker build -t ghcr.io/fenikks/google:small -f Dockerfile.multi .
    #   docker push ghcr.io/fenikks/google:small
    # EOF
  }
  triggers = {
    # run_always = timestamp()
    docker_file = md5(file("Dockerfile.multi"))
  }

}
