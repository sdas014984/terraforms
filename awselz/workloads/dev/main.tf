module "dev_vpc" {
  source = "../../modules/vpc"

  name = "dev-vpc"
  cidr = "10.1.0.0/16"

  private_subnets = ["10.1.1.0/24"]
}

resource "aws_ec2_transit_gateway_vpc_attachment" "dev_attach" {
  subnet_ids         = module.dev_vpc.private_subnets
  transit_gateway_id = aws_ec2_transit_gateway.tgw.id
  vpc_id             = module.dev_vpc.vpc_id
}
