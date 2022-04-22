##################################
# Copyright (c) 2022 CleanSlateTG
# By Lanre Bakare
#
# s3 bucket and dynamodb table for Terraform state management
##################################

resource "aws_s3_bucket" "tf_state_storage" {
  bucket = var.backend_s3_bucket

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_s3_bucket_acl" "tf_state_storage" {
  bucket = aws_s3_bucket.tf_state_storage.id
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "tf_state_storage" {
  bucket = aws_s3_bucket.tf_state_storage.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_public_access_block" "tf_state_storage" {

  bucket = aws_s3_bucket.tf_state_storage.id

  block_public_acls   = true
  block_public_policy = true
}

resource "aws_s3_bucket_server_side_encryption_configuration" "tf_state_storage" {
  bucket = aws_s3_bucket.tf_state_storage.bucket

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.storage_key.arn
      sse_algorithm     = "aws:kms"
    }
  }
}

resource "aws_dynamodb_table" "tf_state_lock" {
  name             = var.backend_dynamodb_table
  billing_mode     = "PAY_PER_REQUEST"
  hash_key         = "LockID"
  stream_enabled   = true
  stream_view_type = "NEW_AND_OLD_IMAGES"

  attribute {
    name = "LockID"
    type = "S"
  }
}

resource "aws_kms_key" "storage_key" {
  description             = "Terraform backend state KMS key for project:${var.project}, application:${var.app_name}."
  deletion_window_in_days = 30
  enable_key_rotation     = "true"
}

resource "aws_kms_alias" "storage_key_alias" {
  name          = "alias/${local.kms_alias}/01"
  target_key_id = aws_kms_key.storage_key.key_id
}