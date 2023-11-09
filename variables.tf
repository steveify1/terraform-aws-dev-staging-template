variable "ami_map" {
  type = object({
    backend_node = object({
      name   = string
      ami_id = string
    })

    frontend_node = object({
      name   = string
      ami_id = string
    })

    blockchain_node = object({
      name   = string
      ami_id = string
    })
  })

  default = {
    backend_node = {
      name   = "Ubuntu 20.04"
      ami_id = "ami-06aa3f7caf3a30282"
    }

    frontend_node = {
      name   = "Ubuntu 20.04"
      ami_id = "ami-06aa3f7caf3a30282"
    }

    blockchain_node = {
      name   = "Ubuntu 20.04"
      ami_id = "ami-06aa3f7caf3a30282"
    }
  }
}

variable "instance_type_map" {
  type = object({
    backend_node    = string
    frontend_node   = string
    blockchain_node = string
  })

  default = {
    backend_node    = "t2.micro"
    frontend_node   = "t2.micro"
    blockchain_node = "t2.small"
  }
}

variable "region" {
  type    = string
  default = "us-east-1"
}

variable "vpc_id" {
  type    = string
  default = "vpc-025bdd790ecbf598f"
}

variable "public_subnet_id" {
  type    = string
  default = "subnet-07ed5a5ec99361305"
}

# variable "private_subnet_id" {
#   type    = string
#   default = ""
# }

/* Key pair for web2-based application */
variable "keypair_web2" {
  type    = string
  default = "projectx-keypair-web2"
}
