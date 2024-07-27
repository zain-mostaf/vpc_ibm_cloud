output "security_group_id" {
  value = length([for sg in data.ibm_is_security_groups.existing_sg.security_groups : sg if sg.name == var.security_group_name]) > 0 ? [for sg in data.ibm_is_security_groups.existing_sg.security_groups : sg if sg.name == var.security_group_name][0].id : ibm_is_security_group.new_sg[0].id
}
