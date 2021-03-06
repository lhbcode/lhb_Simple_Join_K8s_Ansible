terraform {
  required_providers {
    aws = {
      version = "~> 3.74"
      source = "hashicorp/aws"
    }
  }
}
provider "aws" {
  region = "ap-southeast-2" # Please use the default region ID
}

# S3 bucket for backend
resource "aws_s3_bucket" "tfstate" {
  bucket = "terraform-lhb-apse2-tfstate"

  versioning {
    enabled = true # Prevent from deleting tfstate file
  }
}

# DynamoDB for terraform state lock
resource "aws_dynamodb_table" "terraform_state_lock" {
  name           = "terraform-lhb-lock"
  hash_key       = "LockID"
  billing_mode   = "PAY_PER_REQUEST"

  attribute {
    name = "LockID"
    type = "S"
  }
}