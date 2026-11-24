
variable "name" {
  default = "ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"
}

variable "owners" {
  default = "099720109477"
}

variable "algorithm" {
  default = "RSA"
}

variable "rsa_bits" {
  default = 4096
}

variable "key_name" {
  default = "ashwin-dev"
}

variable "pem_file_name" {
  default = "ashwin.pem"
}

variable "aws_dev_security_group" {
  type    = string
  default = "ashwin-dev-security-group"
}

variable "aws_security_group" {
  default = "Allow SSH, HTTP and HTTPS traffic"
}

variable "ssh_port" {
  default = 22
}

variable "http_port" {
  default = 80
}

variable "https_port" {
  default = 443
}

variable "allowed_cidr" {
  type    = list(string)
  default = ["0.0.0.0/0"]
}

variable "security_group_tag" {
  default = "ashwin-sg"
}

variable "instance_type" {
  default = "t3.micro"
}

variable "instance_name" {
  default = "myserver-tst"
}


