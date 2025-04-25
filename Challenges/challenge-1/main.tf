provider "aws" {
  region = "us-east-1"
  profile = "hv-dev"
  
}

resource "aws_security_group" "sg-1" {
  name = "terraformdev"
  vpc_id = "vpc-0b7a0ba3524c21466"
}