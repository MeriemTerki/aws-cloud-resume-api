provider "aws" {
  region = "us-east-1" # Ensure this is the correct region for your S3 bucket
}

terraform {
  backend "s3" {
    bucket  = "my-terraform-state-bucket-resume" # Replace with your actual bucket name
    key     = "terraform/state.tfstate"
    region  = "us-east-1" # Ensure this matches your bucket's region
    encrypt = true
  }
}


