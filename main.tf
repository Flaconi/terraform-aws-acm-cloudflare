resource "aws_acm_certificate" "this" {
  count = var.create_certificate ? 1 : 0

  domain_name               = var.domain_name
  subject_alternative_names = [for san in var.subject_alternative_names : san[0]]
  validation_method         = "DNS"

  options {
    certificate_transparency_logging_preference = var.certificate_transparency_logging_preference ? "ENABLED" : "DISABLED"
  }

  tags = var.tags

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_route53_record" "this" {
  for_each = { for i, dvo in local.acm_domain_validation_options : dvo.domain_name => dvo if var.validate_certificate && dvo.provider != "cloudflare" }

  zone_id = each.value.provider
  name    = each.value.resource_record_name
  type    = each.value.resource_record_type
  ttl     = var.dns_ttl

  records = [each.value.resource_record_value]

  allow_overwrite = var.validation_allow_overwrite_records

  depends_on = [aws_acm_certificate.this]
}

resource "cloudflare_record" "this" {
  for_each = { for i, dvo in local.acm_domain_validation_options : dvo.domain_name => dvo if var.validate_certificate && dvo.provider == "cloudflare" }

  zone_id = data.cloudflare_zone.this[each.key].id
  # https://github.com/cloudflare/terraform-provider-cloudflare/issues/2407#issuecomment-1960712054
  name    = trimsuffix(each.value.resource_record_name, ".${each.value.zone_domain}.")
  type    = each.value.resource_record_type
  content = replace(each.value.resource_record_value, "/.$/", "")
  ttl     = var.dns_ttl
  proxied = false

  allow_overwrite = var.validation_allow_overwrite_records

  depends_on = [aws_acm_certificate.this]
}

resource "aws_acm_certificate_validation" "this" {
  count = var.create_certificate && var.validate_certificate && var.wait_for_validation ? 1 : 0

  certificate_arn = aws_acm_certificate.this[0].arn

  validation_record_fqdns = flatten([try(values(aws_route53_record.this).*.fqdn, []), try(values(cloudflare_record.this).*.hostname, [])])
}
