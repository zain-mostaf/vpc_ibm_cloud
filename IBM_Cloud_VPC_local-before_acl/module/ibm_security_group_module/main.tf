data "ibm_is_security_groups" "existing_sg" {
  vpc_id = var.vpc_id
}

resource "ibm_is_security_group" "new_sg" {
  count        = length([for sg in data.ibm_is_security_groups.existing_sg.security_groups : sg if sg.name == var.security_group_name]) == 0 ? 1 : 0
  name         = var.security_group_name
  vpc          = var.vpc_id
}

resource "ibm_is_security_group_rule" "sg_rule" {
  for_each = { for key, value in var.roles : key => value }

  security_group = length([for sg in data.ibm_is_security_groups.existing_sg.security_groups : sg if sg.name == var.security_group_name]) > 0 ? [for sg in data.ibm_is_security_groups.existing_sg.security_groups : sg if sg.name == var.security_group_name][0].id : ibm_is_security_group.new_sg[0].id

  direction = "inbound"
  ip_version = "ipv4"

  // Define your rules based on the role and policies
  rule = each.key
  remote = {
    address = each.value[0] // Example, you might need to adjust based on your policies
  }
}

