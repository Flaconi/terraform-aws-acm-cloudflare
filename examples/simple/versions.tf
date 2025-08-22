# https://github.com/cloudflare/terraform-provider-cloudflare
terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 5.8"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.10"
    }
  }
  required_version = ">= 1.3"
}
