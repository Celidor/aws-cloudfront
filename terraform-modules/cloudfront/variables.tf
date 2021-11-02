variable "project" {
    description = "The name of the project"
}

variable "bucket_name" {
    description = "Name of origin S3 bucket"
}

variable "bucket_regional_domain_name" {
    description = "Regional domain name of origin S3 bucket"
}

variable "certificate_arn" {
    description = "Certificate ARN"
}

variable "base_domain" {
  description = "Base domain, e.g. example.com"
  default     = "celidor.io"
}

variable "domain_prefix" {
  description = "Domain prefix, e.g. www"
  default     = "aws"
}

variable "tags" {
    description = "Optional tags"
}
