resource "aws_acm_certificate" "website" {
  domain_name       = "${var.domain_prefix}.${var.base_domain}"
  validation_method = "DNS"
  tags              = var.tags
}

data "aws_route53_zone" "website" {
  name         = var.base_domain
  private_zone = false
}

resource "aws_route53_record" "website" {
  for_each = {
    for dvo in aws_acm_certificate.website.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 60
  type            = each.value.type
  zone_id         = data.aws_route53_zone.website.zone_id
}

resource "aws_acm_certificate_validation" "website" {
  certificate_arn         = aws_acm_certificate.website.arn
  validation_record_fqdns = [for record in aws_route53_record.website : record.fqdn]
}