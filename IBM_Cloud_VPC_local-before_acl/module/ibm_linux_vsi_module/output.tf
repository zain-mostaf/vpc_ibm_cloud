output "linux_private_ips" {
  value = [for instance in ibm_is_instance.linux_instance : instance.primary_network_interface[0].primary_ip]
}

output "security_group_id" {
  description = "The ID of the Security group"
  value       = var.create_security_group ?  ibm_is_security_group.sg[0].id :  data.ibm_is_security_group.sg_ds.0.id 
}