terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.27.0"
    }
  }

  backend "s3" {
    bucket       = "82s-expense-tf-bucket-dev"
    key          = "expense-infra-vpc"
    region       = "us-east-1"
    use_lockfile = true
  }
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}