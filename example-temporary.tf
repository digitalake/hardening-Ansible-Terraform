# Defining VM Volume
resource "libvirt_volume" "ubuntu-22-04-amd64" {
  count = length(var.hostname)
  name = "os.image.${var.hostname[count.index]}"
  pool = "libvirt-vms" # List storage pools using virsh pool-list
  #source = "https://cloud-images.ubuntu.com/jammy/20220913/jammy-server-cloudimg-amd64-disk-kvm.img"
  source = "/home/ivanopulo/Downloads/jammy-server-cloudimg-amd64.img"
  format = "qcow2"
}

resource "libvirt_volume" "disk1" {
  count = length(var.hostname)
  name             = "disk1.${var.hostname[count.index]}"
  base_volume_id   = libvirt_volume.ubuntu-22-04-amd64[count.index].id
  base_volume_pool = "libvirt-vms"
  size             = 13221225472
}


data "template_file" "user_data" {
  count = length(var.hostname)
  template = file("${path.module}/cloud_init.cfg")
}

resource "libvirt_cloudinit_disk" "commoninit" {
  count = length(var.hostname)
  name      = "${var.hostname[count.index]}-commoninit.iso"
  pool      = "default" # List storage pools using virsh pool-list
  user_data = data.template_file.user_data[count.index].rendered
}


# Define KVM domain to create
resource "libvirt_domain" "ubuntu-jammy" {
  count = length(var.hostname)
  name = var.hostname[count.index]
  memory = var.memoryMB
  vcpu = var.cpu
  qemu_agent = true
  network_interface {
    network_name   = "default" # List networks with virsh net-list
    wait_for_lease = true
  }

  disk {
    volume_id = element(libvirt_volume.disk1.*.id, count.index)
  }

  cloudinit = libvirt_cloudinit_disk.commoninit[count.index].id

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

# Output Server IP
output "ips" {# show IP, run 'terraform refresh' if not populated
value = libvirt_domain.ubuntu-jammy.*.network_interface.0.addresses
}
