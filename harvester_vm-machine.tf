#Creating master-node1

resource "harvester_virtualmachine" "rke-master1" {
  depends_on = [harvester_image.ubuntu20]
  name            = "master1"
  description = "test raw image"
  namespace = "hrt-main"

  tags = {
    ssh-user = "ubuntu"
  }

  cpu    = 2
  memory = "8Gi"

  start        = true
  hostname     = "master1"
  machine_type = "q35"

  ssh_keys = [
    harvester_ssh_key.mysshkey.name
  ]



  network_interface {
    name         = "nic-1"
    model        = "virtio"
    type         = "bridge"
    network_name = "harvester-public/vlan1"
  }

  disk {
    name       = "rootdisk"
    type       = "disk"
    size       = "50Gi"
    bus        = "virtio"
    boot_order = 1

    image       = "default/ubuntu20"
    auto_delete = true
  }

  cloudinit {
    user_data    = data.template_file.cloud-config-master.rendered 
    network_data = data.template_file.network-config-master1.rendered
  }

}



#Creating master-node2

resource "harvester_virtualmachine" "rke-master2" {
  depends_on = [harvester_virtualmachine.rke-master1]
  name            = "master2"
  description = "test raw image"
  namespace = "hrt-main"
  tags = {
    ssh-user = "ubuntu"
  }

  cpu    = 2
  memory = "8Gi"

  start        = true
  hostname     = "master2"
  machine_type = "q35"

  ssh_keys = [
    harvester_ssh_key.mysshkey.name
  ]



  network_interface {
    name         = "nic-1"
    model        = "virtio"
    type         = "bridge"
    network_name = "harvester-public/vlan1"
  }

  disk {
    name       = "rootdisk"
    type       = "disk"
    size       = "50Gi"
    bus        = "virtio"
    boot_order = 1

    image       = "default/ubuntu20"
    auto_delete = true
  }

  cloudinit {
    user_data    = data.template_file.cloud-config-master.rendered
    network_data = data.template_file.network-config-master2.rendered
  }

}

#Creating master-node3

resource "harvester_virtualmachine" "rke-master3" {
  depends_on = [harvester_virtualmachine.rke-master1, harvester_virtualmachine.rke-master2]
  name            = "master3"
  description = "test raw image"
  namespace = "hrt-main"

  tags = {
    ssh-user = "ubuntu"
  }

  cpu    = 2
  memory = "8Gi"

  start        = true
  hostname     = "master3"
#  hostname     = "${var.prefix}-master-${count.index + 1}"
  machine_type = "q35"

  ssh_keys = [
    harvester_ssh_key.mysshkey.name
  ]

  network_interface {
    name         = "nic-1"
    model        = "virtio"
    type         = "bridge"
    network_name = "harvester-public/vlan1"
  }

  disk {
    name       = "rootdisk"
    type       = "disk"
    size       = "50Gi"
    bus        = "virtio"
    boot_order = 1

    image       = "default/ubuntu20"
    auto_delete = true
  }

  cloudinit {
    user_data    = data.template_file.cloud-config-master.rendered
    network_data = data.template_file.network-config-master3.rendered
  }  
}

#Creating worker-node1

resource "harvester_virtualmachine" "rke-worker1" {
  name            = "worker1"
  #depends_on = [harvester_virtualmachine.rke-master1, harvester_virtualmachine.rke-master2, harvester_virtualmachine.rke-master3]
  description = "test raw image"
  namespace = "hrt-main"

  tags = {
    ssh-user = "ubuntu"
  }

  cpu    = 4
  memory = "16Gi"

  start        = true
  hostname     = "worker1"
  machine_type = "q35"

  ssh_keys = [
    harvester_ssh_key.mysshkey.name
  ]

  network_interface {
    name         = "nic-1"
    model        = "virtio"
    type         = "bridge"
    network_name = "harvester-public/vlan1"
  }

  disk {
    name       = "rootdisk"
    type       = "disk"
    size       = "100Gi"
    bus        = "virtio"
    boot_order = 1

    image       = "default/ubuntu20"
    auto_delete = true
  }

  cloudinit {
    user_data    = data.template_file.cloud-config-worker.rendered
    network_data = data.template_file.network-config-worker1.rendered
  }
}

