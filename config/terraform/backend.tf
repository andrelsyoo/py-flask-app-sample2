terraform {
  backend "s3" {
    bucket         = "playground-tfstate23"
    key            = "<%= expansion('terraspace/:ENV-:TS_APP-:REGION-:MOD_NAME/terraform.tfstate') %>"
    region         = "us-east-2"
    encrypt        = true
    dynamodb_table = "ecsforapp-tfstate23-lock"
  }
}