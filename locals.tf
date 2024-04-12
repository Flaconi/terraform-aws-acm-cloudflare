locals {
  # Get distinct list of domains and SANs
  distinct_domain_names = distinct(
    [for s in concat([var.domain_name], var.subject_alternative_names) : replace(s, "*.", "")]
  )

  # Get the list of distinct domain_validation_options, with wildcard
  # domain names replaced by the domain name
  validation_domains = var.create_certificate ? distinct(
    [for k, v in aws_acm_certificate.this[0].domain_validation_options : merge(
      tomap(v), { domain_name = replace(v.domain_name, "*.", "") }
    )]
  ) : []
}
