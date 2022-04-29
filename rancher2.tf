provider "rancher2" {
  alias     = "admin"
  api_url    = "https://rancher-dev.coe.com"
  access_key = var.rancher2_access_key
  secret_key = var.rancher2_secret_key
  insecure = true
}

# Creating Rancher2 demo cluster with rke configs
resource "rancher2_cluster" "dev" {
  provider                  = rancher2.admin
  name                      = var.cluster_name
  description               = "${var.prefix} rancher2 rke cluster"
  enable_cluster_monitoring = true
  rke_config {
    network {
      plugin = "canal"
    }
  }
}
