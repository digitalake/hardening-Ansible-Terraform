###variables.tf###

# Virtual setup machines variable
variable "vms" {
  description = "Map of vm names to configuration."
  type        = map(any)
}

# Locals var block for creation several similar VMs 
#locals {
#  virtual_machines = toset([
#    "vm1",
#    "vm2",
#    "vm3"
#  ])
#}