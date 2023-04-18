terraform {
  required_version = ">= 1.3.0"
   
  cloud {
    hostname = "app.terraform.io"
    organization = "terraform_test_cloud"
    workspaces {
      name = "migrate-secret-in-vault"
    } 
    } 

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.34.0"
    }
    vault = {
      source  = "hashicorp/vault"
      version = "3.9.1"
        }
  }

}
provider "aws" {
  region  = var.aws_region
 }

provider "vault" {
  address = var.vault_address
 }
