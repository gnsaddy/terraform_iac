# backend file for terraform used to store state file in s3 bucket

terraform {
  backend "s3" {
    bucket = "<your-bucket-name>"
    key    = "ec2-example/terraform.tfstate"
    region = "<your-region>"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.4"
    }
  }

  required_version = ">= 4.1"
}
