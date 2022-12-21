###main.tf###

# Defining VM os-image Volume
resource "libvirt_volume" "ubuntu-22-04-amd64" {
  for_each = var.vms
  name     = "os-img-${each.key}"
  pool     = "libvirt-vms" # List storage pools using virsh pool-list
  source = "/home/ivanopulo/Downloads/jammy-server-cloudimg-amd64.img"
  format = "qcow2"
}

# Defining VM data disk volume
resource "libvirt_volume" "disk1" {
  for_each         = var.vms
  name             = "disk1-${each.key}"
  base_volume_id   = libvirt_volume.ubuntu-22-04-amd64[each.key].id
  base_volume_pool = "libvirt-vms"
  size             = each.value.libvirt_volume_size
}

# Defining cloud init config 
data "template_file" "user_data" {
  for_each = var.vms
  template = file("${path.module}/cloud_init.cfg")
}

# Defining VM cloudinit iso image creation 
resource "libvirt_cloudinit_disk" "commoninit" {
  for_each  = var.vms
  name      = "${each.key}-commoninit.iso"
  pool      = "default" # List storage pools using virsh pool-list
  user_data = data.template_file.user_data[each.key].rendered
  # user_data_replace_on_change = true
}

# Define KVM domain creation
resource "libvirt_domain" "vm_name" {
  for_each   = var.vms
  name       = each.key
  memory     = each.value.memoryMB
  vcpu       = each.value.cpu
  qemu_agent = true

  network_interface {
    network_name   = "default" # List networks with virsh net-list
    wait_for_lease = true
  }

  disk {
    volume_id = libvirt_volume.disk1[each.key].id
  }

  cloudinit = libvirt_cloudinit_disk.commoninit[each.key].id

  console {
    type        = "pty"
    target_type = "serial"
    target_port = "0"
  }

  graphics {
    type        = "spice"
    listen_type = "address"
    autoport    = true
  }
}

#generate inventory file for Ansible
resource "local_file" "hosts_cfg" {
  content = templatefile("${path.module}/templates/ansible-hosts.tpl",
    { content = tomap({
      for vm_name in libvirt_domain.vm_name :
      vm_name.name => vm_name.network_interface.0.addresses.0
    }) }
  )
  filename = "${path.module}/ansible/inventory/hosts.ini"
}
