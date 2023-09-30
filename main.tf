resource "random_string" "bucket_name" {
  length   = 28
  special  = false
  lower    = true
  upper = false
}
resource "aws_s3_bucket" "example" {
  bucket = random_string.bucket_name.result

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}