resource "harvester_ssh_key" "mysshkey" {
  name       = "mysshkey"
  public_key = var.public_key
  namespace = "hrt-main"
 

}


}
