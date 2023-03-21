
resource "aws_s3_bucket" "local-bucket" {
  bucket = var.bucket_name
  tags = {
    Name = "my bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_acl" "local-bucket-acl" {
  bucket = aws_s3_bucket.local-bucket.id
  acl    = var.acl
}

resource "aws_s3_bucket_versioning" "local-bucket-versioning" {
  bucket = aws_s3_bucket.local-bucket.id
  versioning_configuration {
    status = var.versioning
  }
}

resource "aws_kms_key" "mykey" {
  description             = "This key is used to encrypt bucket objects"
  deletion_window_in_days = 10
}


resource "aws_s3_bucket_server_side_encryption_configuration" "side-local-bucket" {
  bucket = aws_s3_bucket.local-bucket.id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.mykey.arn
      sse_algorithm     = "aws:kms"
    }
  }
}