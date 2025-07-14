
resource "aws_instance" "docker" {
  ami           = "ami-09c813fb71547fc4f"
  instance_type = "t3.micro"
  vpc_security_group_ids = local.sg_id

  tags = merge(
    local.common_tags,{
        Name ="${var.project}-${var.environment}-DOCKER"
    }
  )
}

resource "aws_security_group" "allow_all" {
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

  # lifecycle {
  #     create_before_destroy = true
  #   }
  tags = {
    Name = "allow-all"
        }

}

resource "terraform_data" "docker" {
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
}