terraform {
  backend "s3" {
    bucket         = "blockchain-cicd-demo-state"
    key            = "terraform.tfstate"
    region         = "us-east-1"
  }


  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region     = "us-east-1"
 
}
