resource "aws_s3_bucket" "labtestedward" {

  bucket = "${random_pet.bucket.id}-${var.Environment}"

  tags = local.common_tags
}

resource "aws_s3_bucket" "manual" {
  # (resource arguments)
  bucket = "edwardlabsimport"

  tags = {
    "Criado" = "28/11/2022"
  }
}

resource "aws_s3_bucket_object" "this" {

  bucket = aws_s3_bucket.labtestedward.bucket


  key = "config/${local.ip_filepath}"

  source = local.ip_filepath

  etag = filemd5(local.ip_filepath)

  tags = local.common_tags

}

resource "aws_s3_bucket_object" "random" {

  bucket = aws_s3_bucket.labtestedward.bucket


  key = "config/${random_pet.bucket.id}.json"

  source = local.ip_filepath

  etag = filemd5(local.ip_filepath)

  tags = local.common_tags

}