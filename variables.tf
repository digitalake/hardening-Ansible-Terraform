###variables.tf###

# Virtual setup machines variable
variable "vms" {
  description = "Map of vm names to configuration."
  type = map(object({
    memoryMB            = string,
    cpu                 = string,
    libvirt_volume_size = string,
    node_is_master      = bool
  }))
}


#locals {
#  masters = toset([for each in var.vms : libvirt_domain.vm_name.network_interface.0.addresses.0 if each.node_is_master == true])
#  workers = toset([for each in var.vms : each.memoryMB if each.node_is_master == false])
#}
#
#output "result1" {
#  value = local.masters
#}
#
#output "result2" {
#  value = local.workers
#}