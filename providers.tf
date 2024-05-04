terraform {
  required_version = "~> 1.8.2"

  backend "local" {
    path = "terraform.tfstate"
  }
}

provider "aws" {
  region = "us-east-1"
}
