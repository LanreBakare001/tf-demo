##################################
# Copyright (c) 2022 CleanSlateTG
# By Lanre Bakare
#
# Terraform provider, iam policy, and iam role
##################################

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.6.0"
    }
  }
  backend "s3" {}
}

provider "aws" {
  access_key = var.access_key
  secret_key = var.secret_key
  region     = var.region
}