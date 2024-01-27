terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.25.2"
    }
  }
  backend "kubernetes" {
    secret_suffix    = "state"
    config_path      = "~/.kube/config_demo"
    namespace = "kube-system"
  }
}

provider "kubernetes" {
  config_path    = "~/.kube/config_demo"
  config_context = "minikube"

}