variable "instance_count" {
  description = "Number of Linux instances"
  type        = number
}

variable "image_id" {
  description = "Image ID for Linux instances"
  type        = string
}

variable "profile" {
  description = "Profile for the instances"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "zone" {
  description = "Zone for the instances"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID"
  type        = string
}

#variable "security_group_id" {
#  description = "Security group IDs"
#  type        = string
#}

variable "ssh_key_id" {
  description = "SSH key ID"
  type        = string
}

#variable "create_security_group" {
#  description = "True to create new security group. False if security group is already existing and security group rules are to be added"
#  type        = bool
#  default     = false
#}
