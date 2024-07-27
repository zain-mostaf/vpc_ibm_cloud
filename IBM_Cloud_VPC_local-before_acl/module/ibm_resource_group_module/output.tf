output "resource_group_id" {
  value = var.existing_resource_group ? data.ibm_resource_group.existing[0].id : ibm_resource_group.new[0].id
}