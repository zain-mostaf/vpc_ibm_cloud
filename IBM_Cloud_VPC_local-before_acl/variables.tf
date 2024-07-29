variable "ibmcloud_api_key" {
  description = "IBM Cloud API key"
  type        = string
  sensitive   = true
}

variable "region" {
  description = "IBM Cloud region"
  type        = string
}

variable "prefix_name" {
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

    # Optional fields
    icmp = optional(object({
      code = number
      type = number
    }))
    tcp = optional(object({
      port_max        = number
      port_min        = number
      source_port_max = number
      source_port_min = number
    }))
    udp = optional(object({
      port_max        = number
      port_min        = number
      source_port_max = number
      source_port_min = number
    }))
  }))
  default = []
}
variable "create_security_group" {
  description = "false to create new security group. True if security group is already existing and security group rules are to be added"
  type        = bool
  default     = false
}


variable "sg_name" {
  description = "Name of the Security Group"
  type        = string
}


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



variable "ssh_key_name" {
  description = "Name of the SSH key"
  type        = string
}

variable "ssh_public_key" {
  description = "Public key content"
  type        = string
}

variable "linux_instance_count" {
  description = "Number of Linux instances"
  type        = number
}

variable "linux_image_id" {
  description = "Image ID for Linux instances"
  type        = string
}

variable "linux_profile" {
  description = "Profile for Linux instances"
  type        = string
}

variable "windows_instance_count" {
  description = "Number of Linux instances"
  type        = number
}

variable "windows_image_id" {
  description = "Image ID for Linux instances"
  type        = string
}

variable "windows_profile" {
  description = "Profile for Linux instances"
  type        = string
}