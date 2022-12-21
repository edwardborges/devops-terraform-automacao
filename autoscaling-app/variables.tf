variable "aws_region" {
  type        = string
  description = ""
  default     = "us-west-2"
}

variable "aws_account_id" {
  type        = number
  description = ""
  default     = 968339500772
}

variable "service_name" {
  type        = string
  description = ""
  default     = "autoscaling-app"
}

variable "instance_type" {
  type        = string
  description = ""
  default     = "t2.micro"
}

variable "instance_key_name" {
  type        = string
  description = ""
  default     = "testeiac"
}