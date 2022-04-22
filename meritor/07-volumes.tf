# resource "aws_ebs_volume" "default" {
#   # provider = aws.external
#   availability_zone = aws_instance.default.availability_zone
#   size              = 40
#   encrypted         = true
#   kms_key_id        = aws_kms_key.instance_stg_key.arn
#   tags = local.tags
# }

# resource "aws_volume_attachment" "default" {
#   # provider = aws.external
#   device_name = "/dev/sdh"
#   volume_id   = aws_ebs_volume.default.id
#   instance_id = aws_instance.default.id
# }