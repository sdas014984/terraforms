resource "aws_instance" "three" {
    count = 2
    ami = "ami-052064a798f08f0d3"
    instance_type = "t3.micro"
    key_name = "suv-key-pair"
    tags = {  
        Name = "n.virginia-server"
    }
}
