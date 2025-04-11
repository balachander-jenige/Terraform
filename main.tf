resource "aws_instance" "name" {
  ami = var.ami
  subnet_id = var.subnet_id
  vpc_security_group_ids = var.vpc_security_group_ids
  instance_type = var.instance_type
  tags = {
    name="terraformtest"
  }
    
}