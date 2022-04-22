data "aws_iam_policy_document" "assume_role" {

  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["amplify.amazonaws.com"]
    }

    principals {
      type        = "Service"
      identifiers = ["codecommit.amazonaws.com"]
    }

    principals {
      type        = "Service"
      identifiers = ["codebuild.amazonaws.com"]
    }

    principals {
      type        = "Service"
      identifiers = ["codepipeline.amazonaws.com"]
    }

    principals {
      type        = "Service"
      identifiers = ["sns.amazonaws.com"]
    }

    principals {
      type        = "Service"
      identifiers = ["backup.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "default" {
  name                = var.role_name
  assume_role_policy  = join("", data.aws_iam_policy_document.assume_role.*.json)
  managed_policy_arns = ["arn:aws:iam::aws:policy/AdministratorAccess", "arn:aws:iam::aws:policy/service-role/AWSBackupServiceRolePolicyForBackup"]
}
