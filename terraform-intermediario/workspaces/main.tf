terraform {
  required_version = "1.3.3"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  backend "s3" {
    bucket         = "tfstate-240706599189"
    key            = "workspaces/terraform.tfstate"
    region         = "us-west-2"
    dynamodb_table = "tflock-tfstate-240706599189"
  }
}

provider "aws" {
  region  = lookup(var.aws_region, local.env)
}

locals {
  env = terraform.workspace == "default" ? "dev" : terraform.workspace
}

resource "aws_instance" "web" {
  count = lookup(var.instance, local.env)["number"]

  ami           = lookup(var.instance, local.env)["ami"]
  instance_type = lookup(var.instance, local.env)["type"]

  tags = {
    Name = "Minha máquina web ${local.env}"
    Env  = local.env
  }
}