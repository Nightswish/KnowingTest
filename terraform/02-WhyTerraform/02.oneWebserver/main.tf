#terraform {
#  required_version = ">= 0.12, < 0.13"
#}

provider "aws" {
  region = "us-west-1"

  # 2.x 버전의 AWS 공급자 허용
  version = "~> 2.0"
} 

resource "aws_instance" "example" {
  ami = "ami-0427c7b524bf024ed"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.instance.id]

  user_data = <<-EOF
                 #!/bin/bash
                 echo "Hello, World" > index.html
                 nohub busybox httpd -f -p 8080 &
                 EOF

  tags = {
    Name = "terraform-example"
  }
}

resource "aws_security_group" "instance" {
  name = "terraform-exmaple-instance"

  ingress {
  from_port   = 8080
  to_port     = 8080
  protocol    = "tcp"
  cidr_blocks = [ "0.0.0.0/0" ]
  }
} 
