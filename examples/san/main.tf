module "this" {
  source = "../../"

  cloudflare_api_token = var.cloudflare_api_token
  domain_name          = "test-san.${var.domain_name}"
  subject_alternative_names = [
    ["subdomain.test-san.${var.domain_name}", "cloudflare"],
    ["test-other.${var.domain_name}", "cloudflare"]
  ]
}
