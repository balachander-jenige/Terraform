
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"

    }
  }
}
provider "aws" {
  region = "us-east-1"
  profile = "hv-dev"
}


resource "aws_security_group" "security_group_payment_app" {
  name        = "payment_app"
  description = "Application Security Group"
  depends_on  = [aws_eip.example]
  vpc_id = "vpc-0b7a0ba3524c21466"
  tags = {
    Name ="Payments-app"
    Team ="Payments Team"
  }

  # Below ingress allows HTTPS  from DEV VPC
  ingress {
    from_port   = var.HTTPS
    to_port     = var.HTTPS
    protocol    = "tcp"
    cidr_blocks = [var.dev_vpc]
  }

  # Below ingress allows APIs access from DEV VPC

  ingress {
    from_port   = var.APIS
    to_port     = var.APIS
    protocol    = "tcp"
    cidr_blocks = [var.dev_vpc]
  }

  # Below ingress allows APIs access from Prod App Public IP.

  ingress {
    from_port   = var.prd-APIS
    to_port     = var.prd-APIS
    protocol    = "tcp"
    cidr_blocks = ["${aws_eip.example.public_ip}/32"]
  }
  egress {
  from_port   = var.splunk
  to_port     = var.splunk
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
}

}


resource "aws_eip" "example" {
  domain = "vpc"
}
