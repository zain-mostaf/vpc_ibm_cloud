data "ibm_resource_group" "existing" {
  count = var.existing_resource_group ? 1 : 0
  name  = var.resource_group_name
}

resource "ibm_resource_group" "new" {
  count = var.existing_resource_group ? 0 : 1
  name  = var.resource_group_name
}