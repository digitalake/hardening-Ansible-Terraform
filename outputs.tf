###outputs.tf###

#Virtual machines sutup info
output "ip" {
  value = libvirt_domain.ubuntu-jammy
}