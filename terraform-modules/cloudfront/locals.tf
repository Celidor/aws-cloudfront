locals {
  env         = lower(terraform.workspace)
  domain_name = var.domain_prefix == "" ? var.base_domain : "${var.domain_prefix}.${var.base_domain}"
  domain_ref  = replace(local.domain_name, ".", "-")
}