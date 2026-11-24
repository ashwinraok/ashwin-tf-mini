terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.73.0"
    }
  }
}

resource "aws_s3_bucket" "bucket_tst" {
  bucket = var.bucket_tst

  tags = {
    Name        = "qtree-tst-bucket"
    Environment = "env"
  }
}  

