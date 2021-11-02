module "s3-website" {
  source                                = "./terraform-modules/s3-website"
  project                               = var.project
  region                                = var.region
  bucket_name                           = local.bucket_name
  cloudfront_origin_access_identity_arn = module.cloudfront.cloudfront_origin_access_identity_arn
  tags                                  = var.tags
}

module "certificate-manager" {
  source        = "./terraform-modules/certificate-manager"
  base_domain   = var.base_domain
  domain_prefix = var.domain_prefix
  tags          = var.tags
}

module "cloudfront" {
  source                      = "./terraform-modules/cloudfront"
  project                     = var.project
  bucket_name                 = local.bucket_name
  bucket_regional_domain_name = local.bucket_regional_domain_name
  base_domain                 = var.base_domain
  domain_prefix               = var.domain_prefix
  certificate_arn             = module.certificate-manager.certificate_arn
  tags                        = var.tags
}

module "route53" {
  source                 = "./terraform-modules/route53"
  base_domain            = var.base_domain
  domain_prefix          = var.domain_prefix
  cloudfront_domain_name = module.cloudfront.cloudfront_domain_name
  tags                   = var.tags
}