data "ibm_is_vpc" "existing" {
  count = var.existing_vpc ? 1 : 0
  name  = var.vpc_name
}

resource "ibm_is_vpc" "new" {
  count             = var.existing_vpc ? 0 : 1
  name              = var.vpc_name
  resource_group    = var.resource_group_id
  #default_security_group_name = var.default_security_group_name
  #default_network_acl_name = var.default_network_acl_name
  #default_routing_table_name = var.default_routing_table_name
}