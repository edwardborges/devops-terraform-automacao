terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }

  backend "s3" {
    bucket = "tfstate-240706599189"
    key    = "dev/data-sources-s3/terraform.tfstate"
    region = "us-west-2"
  }
}
provider "aws" {
  region = var.aws_region
}
