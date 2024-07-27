# Output variable definitions
output "id" {
  description = "(String) The unique identifier"
  value       = local.vpc_ap_object.id
}
