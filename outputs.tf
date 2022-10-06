###outputs.tf###

#Virtual machines sutup info
output "VM_IPs" {
  value = {
    for k, vm_name in libvirt_domain.vm_name : k => vm_name.network_interface.0.addresses.0
  }
}

#output "ip-vm2" {
#  value = libvirt_domain.ubuntu-jammy["vm2"].network_interface.0.addresses.0
#}
