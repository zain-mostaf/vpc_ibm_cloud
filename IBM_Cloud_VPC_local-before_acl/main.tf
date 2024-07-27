module "resource_group" {
  source                 = "./module/ibm_resource_group_module"
  resource_group_name    = var.resource_group_name
  existing_resource_group = var.existing_resource_group
}

module "vpc" {
  source              = "./module/ibm_is_vpc_module"
  vpc_name            = var.vpc_name
  existing_vpc        = var.existing_vpc
  resource_group_id   = module.resource_group.resource_group_id
}

module "address_prefix" {
  source  = "./module/ibm_is_vpc_address_prefix_module"
  exists  = var.exists_address_prefix
  name    = var.address_prefix_name
  zone    = var.address_prefix_zone
  vpc_id  = module.vpc.vpc_id
  cidr    = var.address_prefix_cidr
}

module "subnet" {
  source             = "./module/ibm_is_subnet_module"
  count = var.subnet_exists == true ? 0 : 1
  subnet_name        = var.subnet_name
  vpc_id             = module.vpc.vpc_id
  ipv4_cidr_block    = var.ipv4_cidr_block
  zone               = var.zone
  address_prefix_id  = module.address_prefix.id
}

module "net_acl" {
  source             = "./module/ibm_acl_module"
  name               = var.acl_name
  count = var.subnet_exists == true ? 0 : 1
  vpc_id             = module.vpc.vpc_id
  subnet_id          = module.subnet[0].subnet_id
  rules              = var.acl_rules
  resource_group_id =  module.resource_group.resource_group_id
}

data "ibm_is_subnet" "subnet" {
  count = var.subnet_exists == true ? 1 : 0
  name  = var.subnet_name
  vpc   = module.vpc.vpc_id
}