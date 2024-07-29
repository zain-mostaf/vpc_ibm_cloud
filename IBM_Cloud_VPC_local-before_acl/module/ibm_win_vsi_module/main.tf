resource "ibm_is_instance" "windows_instance" {
  count            = var.instance_count
  name             = format("%s-ad-%02d", var.vsi_name_prefix, count.index + 1)
  image            = var.image_id
  profile          = var.profile
  vpc              = var.vpc_id
  zone             = var.zone
  resource_group  = var.resource_group_id
  primary_network_interface {
    subnet         = var.subnet_id
    security_groups = [var.security_group_id]
  }
  keys = [var.ssh_key_id]
}
