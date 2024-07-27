output "resource_group_id" {
  description = "The ID of the resource group"
  value       = module.resource_group.resource_group_id
}

output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

output "address_prefix_id" {
  description = "The ID of the VPC address prefix"
  value       = module.address_prefix.id
}

output "security_group_rules" {
  description = "All the IDs of Security group Rules"
  value       = [for rule in ibm_is_security_group_rule.sg_rules : rule.id]
}