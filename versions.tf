terraform {
  required_version = ">= 1.3.7"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "= 5.4.0"
    }
  }
}

provider "aws" {
  region = "us-west-2"
}