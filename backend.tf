terraform {
backend "s3" {
    bucket       = "qtree-ashwin-state-bucket"
    key          = "tf-state-file/terraform.tfstate"
    region       = "ap-south-1"
    encrypt      = true
    use_lockfile = true
  }
}    

