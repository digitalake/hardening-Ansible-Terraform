###terraform.tfvars###

#Virtual machines setup inputs
vms = {
  wordpress-lab = {
    memoryMB            = 1024 * 2,
    cpu                 = 2,
    libvirt_volume_size = 1024 * 1024 * 1024 * 12
  }#,
#  worker1 = {
#    memoryMB            = 1024 * 2,
#    cpu                 = 2,
#    libvirt_volume_size = 1024 * 1024 * 1024 * 12
#  },
#  worker2 = {
#    memoryMB            = 1024 * 2,
#    cpu                 = 2,
#    libvirt_volume_size = 1024 * 1024 * 1024 * 12
#  }
}

#Ansible user input
ansible_user = "deployer"

#Ansible ssh-key for remote connection
ansible_private_key_file = "/home/ivanopulo/.ssh/deploy"


