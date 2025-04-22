provider "aws" {
  region = "us-west-2"
  profile = "hv-dev"

}
resource "aws_security_group" "example" {

  name        = "terraform-firewall"
  description = "managed by terraform"
  vpc_id = "vpc-095f761a169c10b8e"
  tags = {
    Name = "example"
  }
}

resource "aws_vpc_security_group_ingress_rule" "example" {
  security_group_id = aws_security_group.example.id

  cidr_ipv4   = "10.0.0.0/8"
  from_port   = 80
  ip_protocol = "tcp"
  to_port     = 80
}