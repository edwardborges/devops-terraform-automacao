variable "environment" {
  type        = string
  description = "dev"

}

variable "aws_region" {
  type = string

  description = ""

  default = "us-west-2"

}
variable "aws_profile" {
  type = string

  description = ""

  default = "default"

}

variable "instance_ami" {
  type        = string
  description = ""
  default     = "ami-094125af156557ca2"

}

variable "instance_type" {
  type = string

  description = ""

  default = "t2.micro"

}

variable "instance_tags" {
  type = map(string)

  description = ""

  default = {
    Name    = "Ubuntu"
    Project = "Curso Aws com terraform"
  }

}

