provider "aws" {
  region = "us-east-1"
  profile = "hv-dev"
}

resource "aws_iam_user" "lb" {
  name = "admin-user${data.aws_caller_identity.ID.account_id}"
  path = "/system/"

  tags = {
    tag-key = "tag-value"
  }
}


data "aws_caller_identity" "ID" {

  
}



data "aws_iam_users" "users" {
  
}

output "account_ID" {
  value = data.aws_caller_identity.ID.account_id
  
}
output "user_names" {
  value = data.aws_iam_users.users.names
  
  
}
 output "Total_users" {
  value = length(data.aws_iam_users.users.names)
   
 }