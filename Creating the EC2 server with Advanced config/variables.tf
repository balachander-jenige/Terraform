variable "ami" {
  description = "value of ami"
  type = string
}
variable "subnet_id" {
  description = "value of subnet"
  type = string
}
variable "vpc_security_group_ids" {
  description = "list of security group"
  type = list(string)

  
}
variable "instance_type" {
  description = " value of type"
  type = string
  default = "t2.micro"
}