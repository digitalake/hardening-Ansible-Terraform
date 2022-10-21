###terraform.tfvars###

#Virtual machines setup inputs
vms = {
  master = {
    memoryMB            = 1024 * 2,
    cpu                 = 2,
    libvirt_volume_size = 1024 * 1024 * 1024 * 12,
    node_is_master      = true
  },
  worker1 = {
    memoryMB            = 1024 * 2,
    cpu                 = 2,
    libvirt_volume_size = 1024 * 1024 * 1024 * 12,
    node_is_master      = false
  },
  worker2 = {
    memoryMB            = 1024 * 2,
    cpu                 = 2,
    libvirt_volume_size = 1024 * 1024 * 1024 * 12,
    node_is_master      = false

  }
}


