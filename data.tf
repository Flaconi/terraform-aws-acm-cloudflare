data "cloudflare_zone" "this" {
  for_each = { for d, p in local.domain_validation_providers : d => p if p.provider == "cloudflare" }
  name     = each.value.zone_domain
}
