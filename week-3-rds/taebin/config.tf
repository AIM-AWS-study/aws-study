terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.91.0"
    }
  }

  backend "s3" {
    bucket  = "<s3 bucket name>"
    key     = "infra.tfstate"
    region  = "ap-northeast-2"
    encrypt = true
  }
}

provider "aws" {
  region  = "ap-northeast-2"
}

locals {
    config = yamldecode(file("./config.yaml"))
}