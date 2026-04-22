# Example S3 backend. Configure the bucket and DynamoDB table beforehand or create them.
terraform {
  backend "s3" {
    bucket = "my-terraform-state-bucket-32123"   # <== replace with your bucket
    key    = "ecs/terraform.tfstate"
    region = "us-west-2"
    use_lockfile = true     
    encrypt = true
  }
}
