variable "region" {
  description = "AWS region for S3 bucket"
}

variable "project" {
  description = "Name of project"
}

variable "bucket_name" {
  description = "Name of S3 bucket"
}

variable "routing_rules" {
  default = ""
}

variable "cloudfront_origin_access_identity_arn" {
  description = "CloudFront Origin Access Identity ARN"
}

variable "tags" {
  description = "Optional tags"
}
