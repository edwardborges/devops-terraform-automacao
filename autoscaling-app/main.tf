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

#Observação : Criação de VPC e estrutura de app auto escalável 