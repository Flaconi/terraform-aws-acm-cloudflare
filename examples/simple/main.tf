module "this" {
  source = "../../"

  cloudflare_api_token = var.cloudflare_api_token

  zone_name   = var.domain_name
  domain_name = "test.${var.domain_name}"
}
