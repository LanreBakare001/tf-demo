data "aws_iam_policy_document" "assume_role" {

  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]

    principals {
        type        = "Service"
        identifiers = ["ec2.amazonaws.com"]
    }
  }
  
}

resource "aws_iam_role" "default" {
  name                = "ec2-role"
  path = "/"
  assume_role_policy  = join("", data.aws_iam_policy_document.assume_role.*.json)
  managed_policy_arns = ["arn:aws:iam::aws:policy/AdministratorAccess"]
}

resource "aws_iam_instance_profile" "default" {
  name = "ec2-profile"
  role = aws_iam_role.default.name
}

# resource "aws_iam_instance_profile" "default" {
#   name  = format("%s%sinstance-profile", module.labels.id, var.delimiter)
#   role  = var.iam_instance_profile
# }
