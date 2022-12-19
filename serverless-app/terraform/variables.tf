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
  default     = "Todos"
}

variable "service_domain" {
  type        = string
  description = ""
  default     = "api-todos"
}