provider "aws" {
  region = "us-west-2"
  profile = "hv-dev"
  
}

resource "aws_instance" "myec2" {
  ami = "ami-087f352c165340ea1"
subnet_id = "subnet-047c8caae88d24be6"
instance_type = "t2.micro"
vpc_security_group_ids = [ "sg-0b27a7a3907f2b2da" ]
key_name = "terraform-key"



connection {
  type = "ssh"
  user = "ec2-user"
  private_key=file("./terraform-key.pem")
  host = self.public_ip

}

provisioner "local-exec" {
  command = "echo ${self.private_ip} >> server_ip.txt"
  
}
provisioner "remote-exec" {
  inline = [ 
    "sudo yum -y install ngnix",
    "sudo systemctl start nginx"

   ]
  
}
  
}
