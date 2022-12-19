# ------------------------------------------------------------------------------
# SET TERRAFORM AND PROVIDER REQUIREMENTS FOR RUNNING THIS MODULE
# ------------------------------------------------------------------------------

terraform {
  required_version = ">= 1.3.3"

  required_providers {
    aws = ">= 4.40.0"
  }
}