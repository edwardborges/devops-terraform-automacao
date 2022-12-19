variable "aws_region" {
  description = "AWS region where the resources will be created"

  type = object({
    dev  = string
    prod = string
  })

  default = {
    dev  = "us-west-2"
    prod = "us-west-1"
  }
}

variable "instance" {
  description = "Instance configuration per workspace"

  type = object({
    dev = object({
      ami    = string
      type   = string
      number = number
    })
    prod = object({
      ami    = string
      type   = string
      number = number
    })
  })

  default = {
    dev = {
      ami    = "ami-017fecd1353bcc96e"
      type   = "t2.micro"
      number = 1
    }
    prod = {
      ami    = "ami-02ea247e531eb3ce6"
      type   = "t2.micro"
      number = 3
    }
  }
}