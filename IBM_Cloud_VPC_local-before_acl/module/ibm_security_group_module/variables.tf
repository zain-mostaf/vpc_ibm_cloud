variable "vpc_id" {
  description = "VPC ID of the new security group"
  type        = string
}


variable "resource_group_id" {
  description = "Resource group ID"
  type        = string
}

variable "create_security_group" {
  description = "True to create new security group. False if security group is already existing and security group rules are to be added"
  type        = bool
  default     = false
}


variable "name" {
  description = "Name of the Security Group"
  type        = string
}

#variable "security_group" {
#  description = "Existing Security Group's name to which rules are to be attached."
#  type        = string
#  default     = null
#}

variable "security_group_rules" {
  type = list(object({
    name      = string
    direction = string
    remote    = string
    ip_version = optional(string, "ipv4")
    icmp = optional(object({
      code = optional(number)
      type = optional(number)
    }))
    tcp = optional(object({
      port_min = number
      port_max = number
    }))
    udp = optional(object({
      port_min = number
      port_max = number
    }))
  }))
  description = "List of security group rules"
}
