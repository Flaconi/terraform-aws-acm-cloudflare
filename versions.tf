# https://github.com/cloudflare/terraform-provider-cloudflare
terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 4.41"
    }
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5"
    }
  }
  required_version = ">= 1.0"
}
