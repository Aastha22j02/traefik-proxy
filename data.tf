# Cloud-init file for Master instances.
# Installs the required packages, Imports SSH key, and registers node to the cluster based on its roles
data "template_file" "cloud-config-master" {
  template = file("./configs/master-cloud-init.yaml")
  vars = {
    ssh_public_key = harvester_ssh_key.mysshkey.public_key
    register_cmd   = "${rancher2_cluster.dev.cluster_registration_token.0.node_command} --etcd --controlplane"
  }
}


# Cloud-init file for Worker instances.
# Installs the required packages, Imports SSH key, and registers node to the cluster based on its roles
data "template_file" "cloud-config-worker" {
  template = file("./configs/worker-cloud-init.yaml")
  vars = {
    ssh_public_key = harvester_ssh_key.mysshkey.public_key
    register_cmd   = "${rancher2_cluster.dev.cluster_registration_token.0.node_command} --worker"
  }
}



#Network data for Master1.
data "template_file" "network-config-master1" {
  template = file("./configs/master1-network-config.yaml")
}

#Network data for Master2.
data "template_file" "network-config-master2" {
  template = file("./configs/master2-network-config.yaml")
}

#Network data for Master3.
data "template_file" "network-config-master3" {
  template = file("./configs/master3-network-config.yaml")
}

#Network data for Worker1.
data "template_file" "network-config-worker1" {
  template = file("./configs/worker1-network-config.yaml")
}





