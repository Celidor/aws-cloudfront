variable "bucket_name" {
  description = "S3 Bucket Name"
}

variable "bucket_policy_name" {
  description = "Name of bucket policy file in templates without the .json suffix"
}

variable "cf_distribution_id" {
  description = "CloudFront Distribution ID for Origin Access Control"
  default     = ""
}