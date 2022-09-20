locals {
  virtual_machines = {
    "vm1" = { #base_volume_name = "os.img-vm1",
      #resized_volume_name = "disk1-vm1",
      #resized_volume_id = "libvirt_volume.ubuntu-22-04-amd64-vm1.id",
      #cloud_init_diskname = "vm1-commoninit.iso",
      #cloud_init_user_data = "data.template_file.user_data-vm1.rendered",
      #domain_volume_id = "libvirt_volume.disk1-vm1.id",
      #cloud_init_volume_id = "libvirt_cloudinit_disk.commoninit-vm1.id"
    },
    "vm2" = { #base_volume_name = "os.img-vm2",
      #resized_volume_name = "disk1-vm2",
      #resized_volume_id = "libvirt_volume.ubuntu-22-04-amd64-vm2.id",
      #cloud_init_diskname = "vm2-commoninit.iso",
      #cloud_init_user_data = "data.template_file.user_data-vm2.rendered",
      #domain_volume_id = "libvirt_volume.disk1-vm2.id",
      #cloud_init_volume_id = "libvirt_cloudinit_disk.commoninit-vm2.id"
    },
    "vm3" = { #base_volume_name = "os.img-vm3",
      #resized_volume_name = "disk1-vm3",
      #resized_volume_id = "libvirt_volume.ubuntu-22-04-amd64-vm3.id",
      #cloud_init_diskname = "vm3-commoninit.iso",
      #cloud_init_user_data = "data.template_file.user_data-vm3.rendered",
      #domain_volume_id = "libvirt_volume.disk1-vm3.id",
      #cloud_init_volume_id = "libvirt_cloudinit_disk.commoninit-vm3.id"
    }
  }
}