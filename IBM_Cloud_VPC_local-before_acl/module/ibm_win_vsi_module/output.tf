output "windows_private_ips" {
  value = [for instance in ibm_is_instance.windows_instance : instance.primary_network_interface[0].primary_ip]
}
