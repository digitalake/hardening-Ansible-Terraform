# Defining VM Volume
resource "libvirt_volume" "ubuntu-22-04-amd64" {
  for_each = local.virtual_machines
  name     = "os-img-${each.key}"
  pool     = "libvirt-vms" # List storage pools using virsh pool-list
  #source = "https://cloud-images.ubuntu.com/jammy/20220913/jammy-server-cloudimg-amd64-disk-kvm.img"
  source = "/home/ivanopulo/Downloads/jammy-server-cloudimg-amd64.img"
  format = "qcow2"
}

resource "libvirt_volume" "disk1" {
  for_each         = local.virtual_machines
  name             = "disk1-${each.key}"
  base_volume_id   = libvirt_volume.ubuntu-22-04-amd64[each.key].id
  base_volume_pool = "libvirt-vms"
  size             = 13221225472
}


data "template_file" "user_data" {
  for_each = local.virtual_machines
  template = file("${path.module}/cloud_init.cfg")
}

resource "libvirt_cloudinit_disk" "commoninit" {
  for_each  = local.virtual_machines
  name      = "${each.key}-commoninit.iso"
  pool      = "default" # List storage pools using virsh pool-list
  user_data = data.template_file.user_data[each.key].rendered
}


# Define KVM domain to create
resource "libvirt_domain" "ubuntu-jammy" {
  for_each   = local.virtual_machines
  name       = each.key
  memory     = var.memoryMB
  vcpu       = var.cpu
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