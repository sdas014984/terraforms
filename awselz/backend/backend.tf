terraform {
  backend "s3" {
    bucket         = "enterprise-tf-state"
    key            = "landingzone/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "tf-locks"
    encrypt        = true
  }
}
