terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.93.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}

# Using remote backend
terraform {
  backend "s3" {
    bucket = "my-backend-devops201-terraform"
    key    = "flaskappawsec2/tfstate"
    region = "ap-south-1"
  }
}
