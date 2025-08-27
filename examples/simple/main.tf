module "this" {
  source = "../../"

  zone_name   = var.domain_name
  domain_name = "test.${var.domain_name}"
}
