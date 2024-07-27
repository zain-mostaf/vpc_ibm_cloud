variable "vpc_id" {
  description = "VPC ID of the new security group"
  type        = string
  default     = null
}


variable "resource_group_id" {
  description = "Resource group ID"
  type        = string
  default     = null
}

variable "create_security_group" {
  description = "True to create new security group. False if security group is already existing and security group rules are to be added"
  type        = bool
}


variable "sg_name" {
  description = "Name of the new Security Group"
  type        = string
  default     = false
}

#variable "security_group" {
#  description = "Existing Security Group's name to which rules are to be attached."
#  type        = string
#  default     = null
#}

variable "security_group_rules" {
  description = "Security Group rules"
  type = list(object({
    name       = string
    direction  = string
    remote     = string
    ip_version = string
    icmp = object({
      code = number
      type = number
    })
    tcp = object({
      port_max = number
      port_min = number
    })
    udp = object({
      port_max = number
      port_min = number
    })
  }))
  default = []
}