variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ap-south-1"
}

variable "project" {
  description = "Project name prefix"
  type        = string
  default     = "demo-app"
}

variable "vpc_cidr" {
  description = "VPC CIDR block"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "List of public subnet CIDRs (one per AZ)"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs" {
  description = "List of private subnet CIDRs (one per AZ)"
  type        = list(string)
  default     = ["10.0.101.0/24", "10.0.102.0/24"]
}

variable "desired_count" {
  description = "ECS service desired count"
  type        = number
  default     = 2
}

variable "container_port" {
  description = "Container port exposed by app"
  type        = number
  default     = 8080
}

variable "cpu" {
  description = "Task CPU units"
  type        = string
  default     = "256"
}

variable "memory" {
  description = "Task memory (MB)"
  type        = string
  default     = "512"
}

variable "image_tag" {
  description = "Image tag to deploy (used in ECS task definition)"
  type        = string
  default     = "latest"
}
