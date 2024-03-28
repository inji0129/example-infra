terraform {
  cloud {
    organization = "in_serverless"
    workspaces { name = "example-infra" }
  }
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.42.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}