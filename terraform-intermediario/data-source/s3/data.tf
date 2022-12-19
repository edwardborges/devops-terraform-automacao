data "terraform_remote_state" "server" {
  backend = "s3"

  config = {
    bucket = "tfstate-240706599189"
    key    = "dev/data-sources-s3/terraform.tfstate"
    region = var.aws_region
  }
}