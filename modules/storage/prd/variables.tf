variable "env" {
  description = "Environment of s3 bucket"
  type        = string
  default     = "Dev"
}

variable "bucket_prd" {
  description = "Name of s3 bucket"
  type        = string
  default     = "qtree-prd-bucket"
}

