# https://github.com/cloudflare/terraform-provider-cloudflare
terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 3.2"
    }
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3"
    }
  }
  required_version = ">= 0.12.26"
}
