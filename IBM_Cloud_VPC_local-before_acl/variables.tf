variable "ibmcloud_api_key" {
  description = "IBM Cloud API key"
  type        = string
  sensitive   = true
}

variable "region" {
  description = "IBM Cloud region"
  type        = string
}


variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "existing_resource_group" {
  description = "Set to true if the resource group already exists, false to create a new one"
  type        = bool
  default     = false
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

variable "exists_address_prefix" {
  description = "Set to true if the VPC address prefix already exists, false to create a new one"
  type        = bool
  default     = false
}

variable "address_prefix_name" {
  description = "Name (for new or of existing) VPC address prefix"
  type        = string
}

variable "address_prefix_zone" {
  description = "The zone for a new VPC address prefix"
  type        = string
}

variable "address_prefix_cidr" {
  description = "The CIDR for a new VPC address prefix"
  type        = string
}

#variable "exists_subnet" {
#  description = "Set to true if the subnet already exists, false to create a new one"
#  type        = bool
#  default     = false
#}

variable "subnet_name" {
  description = "The name of the subnet"
  type        = string
}

variable "ipv4_cidr_block" {
  description = "The IPv4 CIDR block for the subnet (required if creating a new subnet)"
  type        = string
  default     = null
}

variable "zone" {
  description = "The zone for the subnet"
  type        = string
}

variable "subnet_exists" {
  description = "Set to true if the subnet already exists, false to create a new one"
  type        = bool
  default     = false
}

variable "acl_name" {
  description = "Name of the Network ACL"
  type        = string
}
variable "acl_rules" {
  description = "List of rules that are to be attached to the Network ACL"
  type = list(object({
    name        = string
    action      = string
    source      = string
    destination = string
    direction   = string
    icmp = object({
      code = number
      type = number
    })
    tcp = object({
      port_max        = number
      port_min        = number
      source_port_max = number
      source_port_min = number
    })
    udp = object({
      port_max        = number
      port_min        = number
      source_port_max = number
      source_port_min = number
    })
  }))
  default = []
}