variable "resource_group_id" {
  description = "The ID of the resource group to associate with the VPC"
  type        = string
}

variable "vpc_name" {
  description = "The name of the VPC"
  type        = string
}

variable "existing_vpc" {
  description = "Set to true if the VPC already exists, false to create a new one"
  type        = bool
  default     = false
}

#variable default_security_group_name {
#    type = string
#    description = "the default security group name for a new vpc"
#}

#variable default_network_acl_name {
#    type = string
#    description = "the default network acl name for a new vpc"
#}

#variable default_routing_table_name {
#    type = string
#    description = "the default routing table name for a new vpc"
#}
