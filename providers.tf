###providers.tf###

# Defining Terraform backend + required providers
terraform {
  backend "s3" {
    bucket                      = "tfe"
    key                         = "terraform.tfstate"
    endpoint                    = "http://172.17.0.2:9000"
    access_key                  = "5Scp5tcOIaKYuyup"
    secret_key                  = "fW8XryLfvSPXmatcLUhXlu9c14qfqo7T"
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
  #uri   = "qemu+ssh://ivanopulo@127.0.0.1/system?keyfile=/home/ivanopulo/.ssh/deploy"
  #uri   = "qemu+tcp://localhost:16509/system"
}
