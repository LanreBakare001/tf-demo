output "bucket_id" {
  description = "The name of backend bucket."
  value       = aws_s3_bucket.tf_state_storage.id
}

output "bucket_name" {
  description = "The name of backend bucket."
  value       = aws_s3_bucket.tf_state_storage.bucket
}

output "bucket_arn" {
  description = "The name of backend bucket."
  value       = aws_s3_bucket.tf_state_storage.arn
}

output "dynamodb_table_id" {
  description = "The name of the backend lock table."
  value       = aws_dynamodb_table.tf_state_lock.id
}

output "kms_key_id" {
  description = "The globally unique identifier for the primary key."
  value       = aws_kms_key.storage_key.key_id

}
output "kms_key_arn" {
  description = "The globally unique identifier for the primary key."
  value       = aws_kms_key.storage_key.arn
}

output "kms_address" {
  description = "The globally unique identifier for the primary key."
  value       = aws_kms_alias.storage_key_alias.name
}