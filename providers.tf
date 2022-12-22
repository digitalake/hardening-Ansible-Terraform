###providers.tf###

# Defining Terraform backend + required providers
terraform {
  backend "s3" {
    bucket                      = "tfe"
    key                         = "terraform.tfstate"
    endpoint                    = var.s3_minio_endpoint
    access_key                  = var.access_key
    secret_key                  = var.secret_key
    region                      = "main"
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    skip_region_validation      = true
    force_path_style            = true
  }
  required_providers {
    libvirt = {
      source = "dmacvicar/libvirt"
    }
  }
}


provider "libvirt" {
  ## Configuration options
  uri = "qemu:///system"
  #alias = "server2"
  #uri   = "qemu+ssh://"
  #uri   = "qemu+tcp://"
}
