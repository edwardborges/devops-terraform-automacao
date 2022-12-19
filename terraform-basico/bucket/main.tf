provider "aws" {

  region = "us-west-2"

}

resource "aws_s3_bucket" "labtestedward" {
  bucket = "labtestedward"
  tags = {
    Name        = "My bucket"
    Environment = "Dev"
    ManagedBy   = "Terraform"
    Owner       = "Edward Borges"
    UpdatedAt   = "2022-11-25"
  }
}
resource "aws_s3_bucket_acl" "labtestedward_bucket_acl" {
  bucket = aws_s3_bucket.labtestedward.id
  acl    = "private"
}