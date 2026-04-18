provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "crazy-one" {
  ami           = "ami-0360c520857e3138f"
  instance_type = "t3.micro"
  tags = {
    Name = "crazy-server"
  }
  lifecycle {
    create_before_destroy = true
  }
}