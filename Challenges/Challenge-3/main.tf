provider "aws" {
  region = "us-east-1"
  profile = "hv-dev"
  
}


resource "aws_instance" "my-ec2" {
  for_each = var.instance_config
  ami = each.value.ami
  instance_type = each.value.instance_type
  subnet_id = "subnet-0ec38f92670cd743c"
}