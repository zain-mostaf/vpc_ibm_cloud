#locals {
#  subnet_object = var.exists == true ? data.ibm_is_subnet.subnet[0] : ibm_is_subnet.subnet[0]
#}

#data "ibm_is_subnet" "subnet" {
  #count = var.exists == true ? 1 : 0
#  name  = var.subnet_name
#  vpc   = var.vpc_id
#}

resource "ibm_is_subnet" "subnet" {
 # count              = var.exists == false ? 1 : 0
  name               = var.subnet_name
  vpc                = var.vpc_id
  ipv4_cidr_block    = var.ipv4_cidr_block
  zone               = var.zone
}
