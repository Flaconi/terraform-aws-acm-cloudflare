variable "region" {
  type        = string
  description = "The AWS region this module is strictly bound to."
  default     = "eu-central-1"
}

variable "cloudflare_api_token" {
  description = "The Cloudflare API token."
  type        = string
  sensitive   = true
}

variable "domain_name" {
  description = "A domain name for which the certificate should be issued"
  type        = string
  default     = "example.com"
}
