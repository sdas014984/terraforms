module "hub_vpc" {
  source = "../modules/vpc"

  name = "hub-vpc"
  cidr = "10.0.0.0/16"

  public_subnets  = ["10.0.1.0/24"]
  private_subnets = ["10.0.2.0/24"]
}
resource "aws_vpc_endpoint" "ssm" {
  vpc_id            = var.vpc_id
  service_name      = "com.amazonaws.ap-south-1.ssm"
  vpc_endpoint_type = "Interface"
}