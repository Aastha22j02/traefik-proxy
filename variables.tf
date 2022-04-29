variable "prefix" {
  type = string
  description = "A prefix for created resources to avoid clashing names"
}

variable "count_worker_nodes" {
  type = string
  description = "Number of worker nodes"
  default = "2"
}

variable "count_master" {
  type = string
  description = "Number of master nodes"
  default = "1"
}

variable "rancher2_access_key" {
  type = string
}

 
variable "rancher2_secret_key" {
  type = string
}


variable "cluster_name" {
  type = string
  default = "rke_cluster"
}


variable "public_key" {
  type = string
  description = "SSH Public key content to be imported and used into created instances"
}

