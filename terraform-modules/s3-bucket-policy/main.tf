resource "aws_s3_bucket_policy" "bucket" {
  bucket = var.bucket_name
  policy = templatefile("${path.module}/templates/${var.bucket_policy_name}.json", {
    bucket_name        = var.bucket_name,
    account_id         = data.aws_caller_identity.current.account_id,
    cf_distribution_id = var.cf_distribution_id
  })
}