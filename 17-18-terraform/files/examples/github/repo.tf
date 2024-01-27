resource "github_repository" "tf-modules" {
  name        = "tf-modules"
  description = "My awesome codebase"
  auto_init   = true
  visibility = "public"
}

resource "github_repository_file" "file" {
  #count = length(var.files)
  for_each = fileset("${path.module}/../modules/svc", "*")
  repository          = github_repository.tf-modules.name
  branch              = github_repository.tf-modules.default_branch
  file                = "service/${each.value}"
  content             = file("${path.module}/../modules/svc/${each.value}")
  #file                = "service/${element(var.files, count.index)}"
  #content             = file("../modules/svc/${element(var.files, count.index)}")
  
  commit_message      = "Managed by Terraform"
  commit_author       = "Terraform User"
  commit_email        = "terraform@example.com"
  overwrite_on_create = true
}