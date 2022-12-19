variable "aws_region" {
  type        = string
  description = ""
  default     = "us-west-2"
}


variable "instance_ami" {
  type        = string
  description = ""
  default     = "ami-094125af156557ca2"
}

variable "instance_type" {
  type        = string
  description = ""
  default     = "t2.micro"
}