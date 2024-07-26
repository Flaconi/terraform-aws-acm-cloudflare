data "cloudflare_zone" "this" {
  count = var.create_certificate ? 1 : 0
  name  = var.zone_name
}
