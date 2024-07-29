variable "instance_count" {
  description = "Number of Windows instances"
  type        = number
}

variable "image_id" {
  description = "Image ID for Windows instances"
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

variable "security_group_id" {
  description = "ID of the security group to attach to the instance"
  type        = string
}

variable resource_group_id {
    type = string
    description = "the id of the resource group for a new subnet"
}

variable "vsi_name_prefix" {
  description = "Prefix for VSI names"
  type        = string
}

#ariable "windows_username" {
#  description = "Username for Windows VSI"
#  type        = string
#}

#variable "windows_password" {
#  description = "Password for Windows VSI"
#  type        = string
#  sensitive   = true
#}