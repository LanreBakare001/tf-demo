terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.6.0"
    }
  }
}

provider "aws" {
  # access_key = var.access_key
  # secret_key = var.secret_key
  profile = "Meritor"
  region     = var.region
}

provider "aws" {
  alias = "external"
  profile = "smt"
  region     = var.region
}