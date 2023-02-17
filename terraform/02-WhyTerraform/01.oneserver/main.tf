provider "aws" {
  region = "us-west-1"
} 

resource "aws_instance" "example" {
  ami = "ami-0427c7b524bf024ed"
  instance_type = "t2.micro"

  tags = {
    Name = "terraform-example"
  }
}
