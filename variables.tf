###variables.tf###

# Virtual setup machines variable
variable "vms" {
  description = "Map of vm names to configuration."
  type        = map(any)
}