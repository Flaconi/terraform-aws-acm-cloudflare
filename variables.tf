variable "cloudflare_api_token" {
  description = "The Cloudflare API token."
  type        = string
  sensitive   = true
}

variable "create_certificate" {
  description = "Whether to create ACM certificate"
  type        = bool
  default     = true
}

variable "validate_certificate" {
  description = "Whether to validate certificate by creating DNS record"
  type        = bool
  default     = true
}

variable "validation_allow_overwrite_records" {
  description = "Whether to allow overwrite of Route53 records"
  type        = bool
  default     = true
}

variable "wait_for_validation" {
  description = "Whether to wait for the validation to complete"
  type        = bool
  default     = true
}

variable "certificate_transparency_logging_preference" {
  description = "Specifies whether certificate details should be added to a certificate transparency log"
  type        = bool
  default     = true
}

variable "domain_name" {
  description = "A domain name for which the certificate should be issued"
  type        = string
  default     = ""
}

variable "dns_validation_provider" {
  description = "DNS validation provider setting for the domain name; either aws zone id or cloudflare"
  type        = string
  default     = "cloudflare"
}

variable "subject_alternative_names" {
  description = "The list of domains and their dns providers as tuples; either aws zone id or cloudflare as dns provider"
  type        = list(tuple([string, string]))
  default     = []
}

variable "tags" {
  description = "A mapping of tags to assign to the resource"
  type        = map(string)
  default     = {}
}

variable "dns_ttl" {
  description = "The TTL of DNS recursive resolvers to cache information about this record."
  type        = number
  default     = 120
}
