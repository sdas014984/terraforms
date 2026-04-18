

variable "name" {
  type = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}


variable "key_name" {
  description = "SSH key pair"
  type        = string
}