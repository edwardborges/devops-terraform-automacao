terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }

  }
  backend "s3" {}
}
#criei um arquivo chamado backend.hcl para deixar as informações nele melhor
#assim só preciso dar o comando $ terraform init -backend=true -backend-config="backend.hcl"
#para puxar o arquivo para remote

provider "aws" {
  region = var.aws_region

}