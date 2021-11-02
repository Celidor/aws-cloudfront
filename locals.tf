resource "random_string" "bucket-suffix" {
  length  = 5
  upper   = false
  special = false
}

locals {
  env = lower(terraform.workspace)
}

locals {
  bucket_name                 = "${var.project}-${local.env}-${random_string.bucket-suffix.result}"
  bucket_regional_domain_name = "${local.bucket_name}.s3.${var.region}.amazonaws.com"
}