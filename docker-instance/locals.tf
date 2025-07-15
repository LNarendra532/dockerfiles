locals {
    sg_id = [aws_security_group.allow_all_docker.id]
    
    ami_id = data.aws_ami.joindevops.id

    common_tags = {
    Project     = var.project
    Environment = var.environment
    Terraform   = "true"
  }
}