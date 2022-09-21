###variables.tf###

#Virtual setup machines variable
variable "vms" {
  description = "Map of vm names to configuration."
  type        = map(any)
}

#locals {
#  virtual_machines = toset([
#    "vm1",
#    "vm2",
#    "vm3"
#  ])
#}

#variable "memoryMB" { default = 1024 * 2 }
#
#variable "cpu" { default = 2 }