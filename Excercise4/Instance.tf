resource "aws_instance" "love-instance-1" {

  ami                    = data.aws_ami.amiID.id
  instance_type          = "t3.micro"
  key_name               = "love-key"
  vpc_security_group_ids = [aws_security_group.love-sg.id]
  availability_zone      = "us-east-1a"

  tags = {
    Name    = "love-instance-1"
    Project = "love-web"
  }
}