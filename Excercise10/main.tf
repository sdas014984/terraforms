provider "aws" {

}

module "my-instance" {

    source = "./modules/instance"
  
}

module "my-bucket" {
    source = "./modules/bucket"
  
}