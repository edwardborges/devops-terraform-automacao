locals {

  ip_filepath = "ips.json"
  common_tags = {
    Service     = "Curso Terraform"
    Environment = var.Environment
    ManagedBy   = "Terraform"
    Owner       = "Edward Borges"
    UpdatedAt   = "2022-11-25"
  }
}