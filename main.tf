module "secretsmanager-to-vault-migration" {
  source  = "samgabrail/secretsmanager-to-vault-migration/vault"
  version = "0.0.4"
  secret_names     = var.secret_names
  aws_region = var.aws_region
  vault_kv_path = var.vault_kv_path
}
