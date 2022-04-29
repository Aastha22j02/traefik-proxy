terraform {
  required_version = ">= 0.13"
  required_providers {
    harvester = {
      source  = "registry.terraform.io/harvester/harvester"
      version = "~> 0.2.7"
    }
    rancher2 = {
      source = "rancher/rancher2"
      version = "~> 1.22.2"
    }
  }
}

provider "harvester" {
  kubeconfig = "./kubeconfig.yml"
}
