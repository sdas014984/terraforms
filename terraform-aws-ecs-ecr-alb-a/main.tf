data "aws_availability_zones" "available" {
  state = "available"
}

module "vpc" {
  source = "./modules/vpc"
  project = var.project
  vpc_cidr = var.vpc_cidr
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  aws_region = var.aws_region
  azs = slice(data.aws_availability_zones.available.names, 0, length(var.public_subnet_cidrs))
}

module "ecr" {
  source  = "./modules/ecr"
  project = var.project
}

module "iam" {
  source  = "./modules/iam"
  project = var.project
}

module "alb" {
  source = "./modules/alb"
  project = var.project
  vpc_id = module.vpc.vpc_id
  public_subnet_ids = module.vpc.public_subnet_ids
  container_port = var.container_port
  aws_region = var.aws_region
}

module "ecs" {
  source = "./modules/ecs"
  project = var.project
  cluster_name = "${var.project}-cluster"
  vpc_id = module.vpc.vpc_id
  private_subnet_ids = module.vpc.private_subnet_ids
  ecs_sg_id = module.vpc.ecs_security_group_id
  alb_target_group_arn = module.alb.target_group_arn
  ecr_repo_url = module.ecr.repository_url
  task_exec_role_arn = module.iam.task_execution_role_arn
  desired_count = var.desired_count
  container_port = var.container_port
  cpu = var.cpu
  memory = var.memory
  image_tag = var.image_tag
  aws_region = var.aws_region
}
