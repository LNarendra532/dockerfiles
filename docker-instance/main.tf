
resource "aws_instance" "docker" {
  ami           = local.ami_id
  instance_type = "t3.medium"
  vpc_security_group_ids = local.sg_id

# need more for terraform
  root_block_device {
    volume_size = 50
    volume_type = "gp3" # or "gp2", depending on your preference
  }
  
  tags = merge(
    local.common_tags,{
        Name ="${var.project}-${var.environment}-DOCKER"
    }
  )
}

resource "aws_security_group" "allow_all_docker" {
  name = "allow_all"
  description = "allow all traffic"

    ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"  #If you select a protocol of -1 (semantically equivalent to all
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
            }

    egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"  #If you select a protocol of -1 (semantically equivalent to all
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
            }

  lifecycle {
      create_before_destroy = true
    }
  tags = {
    Name = "allow-all-docker"
        }

}

/* resource "terraform_data" "docker" {
  triggers_replace = [
    aws_instance.docker.id
  ]
  
  # Copies the provision.sh file into /tmp
  provisioner "file" {
    source      = "docker.sh"
    destination = "/tmp/docker.sh"
  }

  connection {
    type     = "ssh"
    user     = "ec2-user"
    password = "DevOps321"
    host     = aws_instance.docker.private_ip
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/docker.sh",
      "sudo sh /tmp/docker.sh ",
      
    ]
  }
} */

#D:\DevOps\Repos\dockerfiles\docker-instance\main.tf