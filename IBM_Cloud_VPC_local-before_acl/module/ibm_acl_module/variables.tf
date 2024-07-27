variable "name" {
  description = "Name of the Network ACL"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "subnet_id" {
  description = "VPC ID"
  type        = string
}

variable "resource_group_id" {
  description = "Resource group ID"
  type        = string
  default     = null
}

variable "rules" {
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