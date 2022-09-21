###terraform.tfvars###

#Virtual machines setup inputs
vms = {
  vm1 = {
    memoryMB            = 1024 * 4,
    cpu                 = 1,
    libvirt_volume_size = 1024 * 1024 * 1024 * 12
  },
  vm2 = {
    memoryMB            = 1024 * 2,
    cpu                 = 2,
    libvirt_volume_size = 1024 * 1024 * 1024 * 11
  },
  vm3 = {
    memoryMB            = 1024 * 1,
    cpu                 = 1,
    libvirt_volume_size = 1024 * 1024 * 1024 * 10

  }
}