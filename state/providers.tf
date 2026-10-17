terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.45.0"
    }
  }

  backend "s3" {
    bucket = "remotestate-lock"
    key    = "remote-state-lock"
    region = "us-east-1"
    encrypt        = true
    use_lockfile = true
  }
}
provider "aws" {
  # Configuration options
}