data "ibm_is_security_groups" "existing_sg" {
  vpc_id = var.vpc_id
}

resource "ibm_is_security_group" "new_sg" {
  count        = length([for sg in data.ibm_is_security_groups.existing_sg.security_groups : sg if sg.name == var.security_group_name]) == 0 ? 1 : 0
  name         = var.security_group_name
  vpc          = var.vpc_id
  dynamic "roles" {
    for_each = var.roles
    content {
      role = roles.value
    }
  }
}