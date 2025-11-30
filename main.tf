module "s3-website" {
  source      = "./terraform-modules/s3-website"
  region      = var.region
  bucket_name = local.bucket_name
  tags        = var.tags
}

module "certificate-manager" {
  source        = "./terraform-modules/certificate-manager"
  base_domain   = var.base_domain
  domain_prefix = var.domain_prefix
  tags          = var.tags
}

module "cloudfront" {
  source                      = "./terraform-modules/cloudfront"
  bucket_name                 = module.s3-website.s3_bucket_name
  bucket_regional_domain_name = module.s3-website.s3_bucket_regional_domain_name
  base_domain                 = var.base_domain
  domain_prefix               = var.domain_prefix
  certificate_arn             = module.certificate-manager.certificate_arn
  tags                        = var.tags
}

module "s3_bucket_policy_oac" {
  source = "./terraform-modules/s3-bucket-policy"

  bucket_name        = module.s3-website.s3_bucket_name
  bucket_policy_name = "oac"
  cf_distribution_id = module.cloudfront.cloudfront_distribution_id
}

module "route53" {
  source                 = "./terraform-modules/route53"
  base_domain            = var.base_domain
  domain_prefix          = var.domain_prefix
  cloudfront_domain_name = module.cloudfront.cloudfront_domain_name
  tags                   = var.tags
}