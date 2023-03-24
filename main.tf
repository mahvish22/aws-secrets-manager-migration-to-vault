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
provider "vault" {
  address = "http://127.0.0.1:8200"
  token = "hvs.oMgxlkhmmAIyK0ujJyqc6eWj"
}

module "secretsmanager-to-vault-migration" {
  source  = "samgabrail/secretsmanager-to-vault-migration/vault"
  version = "0.0.4"
  secret_names     = var.secret_names
  aws_region = var.aws_region
  vault_kv_path = var.vault_kv_path
  vault_namespace = var.vault_namespace
}