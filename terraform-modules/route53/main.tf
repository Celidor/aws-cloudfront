data "aws_route53_zone" "website" {
  name         = var.base_domain
  private_zone = false
}

resource "aws_route53_record" "cloudfront" {
  zone_id = data.aws_route53_zone.website.zone_id
  name    = "${var.domain_prefix}.${var.base_domain}"
  type    = "CNAME"
  ttl     = "300"
  records = [var.cloudfront_domain_name]
}
