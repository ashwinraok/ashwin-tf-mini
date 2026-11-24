terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.73.0"
    }
  }
}

resource "aws_s3_bucket" "bucket_dev" {
  bucket = var.bucket_dev

  tags = {
    Name        = "qtree-dev-bucket"
    Environment = "env"
  }
} 

