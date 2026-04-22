# terraform-aws-ecs-ecr-alb

Opinionated Terraform repo to provision:
- VPC (public + private subnets)
- ECR repository
- ALB with target group & listener
- ECS (Fargate) cluster, task definition & service
- IAM role for ECS task execution

Customize terraform.tfvars before running.
