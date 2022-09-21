###terraform.tfvars###

#Virtual machines setup inputs
vms = {
  vm1 = {
    memoryMB            = 1024 * 4,
    cpu                 = 1,
    libvirt_volume_size = 13221225472
  },
  vm2 = {
    memoryMB            = 1024 * 2,
    cpu                 = 2,
    libvirt_volume_size = 13221225472
  },
  vm3 = {
    memoryMB            = 1024 * 1,
    cpu                 = 1,
    libvirt_volume_size = 13221225472

  }
}