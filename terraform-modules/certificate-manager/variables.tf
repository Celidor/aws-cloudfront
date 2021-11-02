variable "region" {
    description = "AWS region for certificate manager"
    default     = "us-east-1"
}

variable "domain_prefix" {
    description = "prefix to base domain, e.g. www"
}

variable "base_domain" {
    description = "base domain, e.g. example.com"
}

variable "tags" {
    description = "Optional tags"
}
