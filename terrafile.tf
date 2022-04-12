terraform {
  backend "s3" {
    bucket  = "bucket-labjoao"
    key     = "lab.tfstate"
    region  = "sa-east-1"
    encrypt = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.9.0"
    }
  }
}

module "ec2_module" {
  source = "git@github.com:joaomarcosad/ec2-module?ref=v0.2"
  name   = "ec2-module"
}

output "ip_address" {
  value = module.ec2_module.ip_address
}

provider "aws" {
  region = "sa-east-1"
}