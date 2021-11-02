variable "project" {
  description = "abbreviation for the project, forms first part of resource names"
  default     = "aws-cloudfront"
}

variable "region" {
  description = "AWS region, must be us-east-1 for certificate manager to work with CloudFront"
  default     = "us-east-1"
}

variable "base_domain" {
  description = "Base domain, e.g. example.com"
}

variable "domain_prefix" {
  description = "Domain prefix, e.g. www"
}

variable "tags" {
  type        = map(string)
  description = "Optional Tags"
  default     = {}
}
