# https://github.com/cloudflare/terraform-provider-cloudflare
terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = ">= 3.34"
    }
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4"
    }
  }
  required_version = ">= 1.0"
}
