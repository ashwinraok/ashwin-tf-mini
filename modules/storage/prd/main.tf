terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.73.0"
    }
  }
}

resource "aws_s3_bucket" "bucket_prd" {
  bucket = var.bucket_prd

  tags = {
    Name        = "qtree-prd-bucket"
    Environment = "env"
  }
}  

