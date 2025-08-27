data "cloudflare_zones" "this" {
  name = var.zone_name
}
