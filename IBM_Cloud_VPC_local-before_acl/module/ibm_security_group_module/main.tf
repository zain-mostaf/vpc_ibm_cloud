data "ibm_is_security_group" "sg_ds" {
  count          = var.create_security_group ? 1 : 0
  name           = var.name
}

resource "ibm_is_security_group" "sg" {
  count          = var.create_security_group ? 0 : 1
  name           = var.name
  vpc            = var.vpc_id
  resource_group = var.resource_group_id
}

resource "ibm_is_security_group_rule" "sg_rules" {
  for_each   = { for r in var.security_group_rules : r.name => r }
  group      = var.create_security_group ? data.ibm_is_security_group.sg_ds.0.id : ibm_is_security_group.sg[0].id 
  direction  = each.value.direction
  remote     = each.value.remote != "" ? each.value.remote : null
  ip_version = each.value.ip_version

  dynamic "icmp" {
    for_each = lookup(each.value, "icmp", null) == null ? [] : [each.value.icmp]
    content {
      code = lookup(icmp.value, "code", null)
      type = lookup(icmp.value, "type", null)
    }
  }

  dynamic "tcp" {
    for_each = lookup(each.value, "tcp", null) == null ? [] : [each.value.tcp]
    content {
      port_min = tcp.value.port_min
      port_max = tcp.value.port_max
    }
  }

  dynamic "udp" {
    for_each = lookup(each.value, "udp", null) == null ? [] : [each.value.udp]
    content {
      port_min = udp.value.port_min
      port_max = udp.value.port_max
    }
  }
}
