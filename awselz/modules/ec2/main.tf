resource "aws_instance" "app" {
  ami           = "ami-0f58b397bc5c1f2e8"
  instance_type = var.instance_type
  key_name = var.key_name
  associate_public_ip_address = false

  tags = {
    Name = var.name
  }
}


