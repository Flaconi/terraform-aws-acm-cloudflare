module "this" {
  source = "../../"

  cloudflare_api_token = var.cloudflare_api_token
  domain_name          = "test.${var.domain_name}"
}
