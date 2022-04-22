##################################
# Copyright (c) 2022 CleanSlateTG
# By Lanre Bakare
#
# Output file
##################################

output "iam_access_role" {
  value = aws_iam_role.default.arn
}