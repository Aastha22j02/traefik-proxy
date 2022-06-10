resource "harvester_image" "ubuntu2" {
  name      = "ubuntu2"
  namespace = "hrt-main"

  display_name = "ubuntu20-x86_64"
  source_type  = "download"
  url          = "http://cloud-images.ubuntu.com/releases/focal/release/ubuntu-20.04-server-cloudimg-amd64.img"
}
