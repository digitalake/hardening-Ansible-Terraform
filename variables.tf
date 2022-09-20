#variable "memoryMB" { default = 1024 * 2 }
#
#variable "cpu" { default = 2 }


variable "vms" {
  description = "Map of vm names to configuration."
  type        = map(any)
}
