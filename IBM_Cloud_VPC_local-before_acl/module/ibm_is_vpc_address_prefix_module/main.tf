locals {
   vpc_ap_object = var.exists == true ? data.ibm_is_vpc_address_prefix.address_prefix[0] : ibm_is_vpc_address_prefix.address_prefix[0]
}

data "ibm_is_vpc_address_prefix" "address_prefix" {
  count = var.exists == true ? 1:0
  vpc = var.vpc_id
  address_prefix_name = var.name
}

resource "ibm_is_vpc_address_prefix" "address_prefix" {
    count = var.exists == false ? 1:0
    name = var.name
    zone = var.zone
    vpc  = var.vpc_id
    cidr = var.cidr
}