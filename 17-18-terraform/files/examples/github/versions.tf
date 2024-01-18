terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }
  }
  backend "kubernetes" {
    secret_suffix    = "state-github"
    config_path      = "~/.kube/config_demo"
    namespace = "kube-system"
  }
}

# Configure the GitHub Provider
provider "github" {
  token = var.tf_token
}
