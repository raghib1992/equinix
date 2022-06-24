provider "aws" {
    region = var.AWS-REGION
    profile = var.PROFILE
}

terraform {
  required_version = ">=0.14.3"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "3.0.0"
    }
  }
}