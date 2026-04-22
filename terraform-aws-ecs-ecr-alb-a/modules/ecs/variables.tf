variable "project" {
  type = string
  default = "demo-app"
}

variable "cluster_name" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "private_subnet_ids" {
  type = list(string)
}

variable "ecs_sg_id" {
  type = string
}

variable "alb_target_group_arn" {
  type = string
}

variable "ecr_repo_url" {
  type = string
}

variable "task_exec_role_arn" {
  type = string
}

variable "desired_count" {
  type = number
  default = 1
}

variable "container_port" {
  type = number
  default = 8080
}

variable "cpu" {
  type = string
  default = "256"
}

variable "memory" {
  type = string
  default = "512"
}

variable "image_tag" {
  type = string
  default = "latest"
}

variable "aws_region" {
  type = string
  default = "ap-south-1"
}
