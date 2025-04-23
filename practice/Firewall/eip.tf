provider "aws" {
  region = "us-east-1"
  profile = "hv-dev"
  
}

resource "aws_eip" "lb" {
  domain   = "vpc"
}

resource "aws_security_group" "example" {

  name        = "terraform-firewall"
  description = "managed by terraform"
  vpc_id = "vpc-0b7a0ba3524c21466"
  tags = {
    Name = "example"
  }
}

resource "aws_vpc_security_group_ingress_rule" "example" {
  security_group_id = aws_security_group.example.id

  cidr_ipv4   = "${aws_eip.lb.public_ip}/32"
  from_port   = 80
  ip_protocol = "tcp"
  to_port     = 80
}

output "public_ip" {
  value = aws_eip.lb.public_ip
  
}