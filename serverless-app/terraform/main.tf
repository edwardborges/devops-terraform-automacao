terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }

  }

  backend "s3" {}
}

provider "aws" {
  region = var.aws_region

}

#Observação : Como usarei um backend s3 
#o comando é $ terraform init -backend=true -backend-config="backend.hcl"