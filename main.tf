resource "aws_acm_certificate" "this" {
  domain_name               = var.domain_name
  subject_alternative_names = var.subject_alternative_names
  validation_method         = "DNS"

  key_algorithm = var.key_algorithm

  options {
    certificate_transparency_logging_preference = var.certificate_transparency_logging_preference ? "ENABLED" : "DISABLED"
  }

  tags = var.tags

  lifecycle {
    create_before_destroy = true
  }
}

resource "cloudflare_dns_record" "this" {
  for_each = var.validate_certificate ? toset(local.distinct_domain_names) : []

  zone_id = local.zone_id
  name    = local.validation_domains[each.key]["resource_record_name"]
  type    = local.validation_domains[each.key]["resource_record_type"]
  content = replace(local.validation_domains[each.key]["resource_record_value"], "/.$/", "")
  ttl     = var.dns_ttl
  proxied = false

  depends_on = [aws_acm_certificate.this]
}

resource "aws_acm_certificate_validation" "this" {
  count = var.validate_certificate && var.wait_for_validation ? 1 : 0

  certificate_arn = aws_acm_certificate.this.arn

  validation_record_fqdns = cloudflare_dns_record.this.*.name
}
