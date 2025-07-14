locals {
    sg_id = [aws_security_group.allow_all.id]

    common_tags = {
    Project     = var.project
    Environment = var.environment
    Terraform   = "true"
  }
}