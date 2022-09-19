variable "hostname" {
    type = list(string)
    default = ["ubuntu.node1", "ubuntu.node2", "ubuntu.node3"]
}

variable "domain" { default = "local" }

variable "memoryMB" { default = 1024*2 }

variable "cpu" { default = 2  }

