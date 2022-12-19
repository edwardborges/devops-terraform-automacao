output "bucket_name" {

  value = aws_s3_bucket.labtestedward

}

output "bucket_arn" {

  value = aws_s3_bucket.labtestedward.arn

  description = "teste de arn"

}

output "bucket_domian_name" {

  value = aws_s3_bucket.labtestedward.bucket_domain_name

}

output "ips_file_path" {
  value = "${aws_s3_bucket.labtestedward.bucket}/${aws_s3_bucket_object.this.key}"


}