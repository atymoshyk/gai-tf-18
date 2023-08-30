terraform {
  backend "s3" {
    bucket         = "atymoshy-terraform-state"
    key            = "tf-state-infra/terraform.tfstate"
    region         = "eu-west-1"
    dynamodb_table = "atymoshy-terraform-locks"
    encrypt        = true
  }
}
