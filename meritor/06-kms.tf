# resource "aws_kms_key" "instance_stg_key" {
#   # provider = aws.external
#   deletion_window_in_days = 30
#   enable_key_rotation     = "true"
# }

# resource "aws_kms_alias" "instance_stg_key" {
#   # provider = aws.external
#   name          = "alias/instance_stg_key"
#   target_key_id = aws_kms_key.instance_stg_key.key_id
# }