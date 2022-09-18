# Defining VM Volume
resource "libvirt_volume" "jammy-server-img" {
  name = "jammy.img"
  pool = "libvirt-vms" # List storage pools using virsh pool-list
  #source = "https://cloud.centos.org/centos/7/images/CentOS-7-x86_64-GenericCloud.qcow2"
  source = "https://cloud-images.ubuntu.com/jammy/20220913/jammy-server-cloudimg-amd64-disk-kvm.img"
  #source = "./CentOS-7-x86_64-GenericCloud.qcow2"
  #format = "qcow2"
}

# Define KVM domain to create
resource "libvirt_domain" "ubuntu-jammy" {
  name   = "ubuntu-jammy"
  memory = "2048"
  vcpu   = 2

  network_interface {
    network_name = "default" # List networks with virsh net-list
    wait_for_lease = true
  }

  disk {
    volume_id = libvirt_volume.jammy-server-img.id
  }

  console {
    type = "pty"
    target_type = "serial"
    target_port = "0"
  }

  graphics {
    type = "spice"
    listen_type = "address"
    autoport = true
  }
}

# Output Server IP
#output "ip" {
 # value = libvirt_domain.ubuntu-jammy.network_interface.0.addresses.0
#}
