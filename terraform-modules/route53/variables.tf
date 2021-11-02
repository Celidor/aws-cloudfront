variable "domain_prefix" {
    description = "prefix to base domain, e.g. www"
}

variable "base_domain" {
    description = "base domain, e.g. example.com"
}

variable "cloudfront_domain_name" {
    description = "CloudFront Domain Name"
}

variable "tags" {
    description = "Optional tags"
}
