variable "project" {
  type = string
}

variable "vpc_cidr" {
  type = string
}

variable "public_subnet_cidrs" {
  type = list(string)
}

variable "private_subnet_cidrs" {
  type = list(string)
}

variable "aws_region" {
  type = string
}

variable "azs" {
  type = list(string)
}

variable "container_port" {
  type = number
  default = 8080
}
