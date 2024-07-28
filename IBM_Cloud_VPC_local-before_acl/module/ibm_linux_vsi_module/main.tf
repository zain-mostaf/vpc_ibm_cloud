resource "ibm_is_instance" "linux_instance" {
  count            = var.instance_count
  name             = format("az-worker-%04d", count.index + 1)
  image            = var.image_id
  profile          = var.profile
  vpc              = var.vpc_id
  zone             = var.zone
  primary_network_interface {
    subnet         = var.subnet_id
    security_group_id  = var.security_group_id
  }
  keys = [var.ssh_key_id]
}
