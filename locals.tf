resource "random_string" "bucket-suffix" {
  length  = 5
  upper   = false
  special = false
}

locals {
  env = lower(terraform.workspace)
}

locals {
  domain_name                 = var.domain_prefix == "" ? var.base_domain : "${var.domain_prefix}.${var.base_domain}"
  domain_ref                  = replace(local.domain_name, ".", "-")
  bucket_name                 = "${local.domain_ref}-${local.env}-${random_string.bucket-suffix.result}"
  bucket_regional_domain_name = "${local.bucket_name}.s3.${var.region}.amazonaws.com"
}