locals {
  zone_id = lookup(data.cloudflare_zones.this.result[0], "id")

  # Get distinct list of domains and SANs
  distinct_domain_names = distinct(
    [for s in concat([var.domain_name], var.subject_alternative_names) : replace(s, "*.", "")]
  )

  # Get the map of domain_validation_options, based on distinct_domain_names
  validation_domains = { for d in local.distinct_domain_names :
    d => [for o in aws_acm_certificate.this.domain_validation_options :
      o if o.domain_name == d
    ][0]
  }
}
