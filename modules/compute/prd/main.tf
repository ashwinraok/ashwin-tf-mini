######## basic server #############

data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "tls_private_key" "ashwin" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "ashwin" {
  key_name   = "ashwin-prd"
  public_key = tls_private_key.ashwin.public_key_openssh
}

resource "aws_security_group" "ashwin_sg" {
  name        = "ashwin-prd-security-group"
  description = "Allow SSH, HTTP and HTTPS traffic"

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "ashwin-prd-sg"
  }
}

resource "local_sensitive_file" "ashwin_pem" {
  filename        = "${path.module}/ashwin.pem"
  content         = tls_private_key.ashwin.private_key_pem
  file_permission = "0600"
}

resource "aws_instance" "myserverprd" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"
  key_name = aws_key_pair.ashwin.key_name
  vpc_security_group_ids = [aws_security_group.ashwin_sg.id]
  tags = {
    Name = "myserver-prd"
  }
}



