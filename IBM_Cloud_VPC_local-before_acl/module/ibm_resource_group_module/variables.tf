variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "existing_resource_group" {
  description = "Set to true if the resource group already exists, false to create a new one"
  type        = bool
  default     = false
}