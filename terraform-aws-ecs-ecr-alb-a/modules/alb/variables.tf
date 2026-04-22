variable "project" {
  type = string
}
variable "vpc_id" {
  type = string
}
variable "public_subnet_ids" {
  type = list(string)
}
variable "container_port" {
  type = number
  default = 8080
}
variable "aws_region" {
  type = string
  default = "ap-south-1"
}
