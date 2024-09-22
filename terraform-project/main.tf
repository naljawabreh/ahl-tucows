terraform {
  required_version = ">= 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  backend "s3" {
    bucket         = "nizam-terre-state"
    key            = "terraform/state/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terre-lock-table"
  }
}

provider "aws" {
  region = var.region

  default_tags {
    tags = {
      Environment = var.environment
      Owner       = var.Owner
      Repo        = var.Repo
      App         = "ahl-tucows"
    }
  }
}

locals {
  name_prefix = "dev"

  common_tags = {
    Project     = var.project
  }
}

data "aws_availability_zones" "available" {}
