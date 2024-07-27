variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
}

variable "security_group_name" {
  description = "Name of the security group"
  type        = string
}

variable "roles" {
  description = "Roles for the security group"
  type        = map(list(string))
}