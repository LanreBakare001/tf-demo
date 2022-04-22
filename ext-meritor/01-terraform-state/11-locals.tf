locals {
  kms_alias            = join("-", [var.project, var.app_name, "backend-state-kms"])
}