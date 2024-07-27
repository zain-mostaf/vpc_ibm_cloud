#variable "exists" {
#  description = "Set to true if the subnet already exists, false to create a new one"
#  type        = bool
#  default     = false
#}

variable "subnet_name" {
  description = "The name of the subnet"
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC"
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

variable "address_prefix_id" {
  description = "The ID of the address prefix"
  type        = string
}
