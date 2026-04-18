module "prod_vpc" {
  source = "../../modules/vpc"

  name = "prod-vpc"
  cidr = "10.2.0.0/16"

  private_subnets = ["10.2.1.0/24"]
}
