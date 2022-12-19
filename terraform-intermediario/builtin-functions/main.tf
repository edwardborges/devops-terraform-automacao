terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.23.0"
    }
    archive = {
      source  = "hashicorp/archive"
      version = "2.0.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.0.1"
    }
    template = {
      source  = "hashicorp/template"
      version = "2.2.0"
    }
  }
}

provider "aws" {
  region = var.aws_region

}

#Importante como criamor um variavel de env ele vai perguntar o valor, digite "dev" no comando terraform plan
#se eu quiser subir um instancia de Dev
#No comando terraform apply digite: terraform apply -var="env=dev" -auto-approve
#agora se eu quiser subir um instancia de Prod coloco 
#uso o comando terraform apply -var="env=prod" -auto-approve