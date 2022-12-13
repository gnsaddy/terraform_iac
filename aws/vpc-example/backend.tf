# backend file for terraform used to store state file in s3 bucket

terraform {
  backend "s3" {
    bucket = "terraform-state-tfbackup"
    key    = "tf-backup-state"
    region = "us-east-2"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.4"
    }
  }

  required_version = ">= 1.2.0"
}
