variable "region" {
  description = "AWS region for S3 bucket"
}

variable "bucket_name" {
  description = "Name of S3 bucket"
}

variable "routing_rules" {
  default = ""
}

variable "tags" {
  description = "Optional tags"
}
