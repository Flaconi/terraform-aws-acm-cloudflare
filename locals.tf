locals {
  # Creates a map of domains and their dns providers
  domain_validation_providers = {
    for v in concat([[var.domain_name, var.dns_validation_provider]], var.subject_alternative_names) : v[0] => { provider = v[1]
      # if condition to check the root domain; flaconi.de vs www.flaconi.de
      zone_domain = length(split(".", v[0])) == 2 ? v[0] : regex("^.+\\.(.+\\..+)$", v[0])[0]
    }
  }

  # Enrich domain_validation_options with their dns providers
  acm_domain_validation_options = var.create_certificate && var.validate_certificate ? [
    for i, dvo in aws_acm_certificate.this[0].domain_validation_options :
    merge(dvo, {
      provider    = local.domain_validation_providers[dvo.domain_name]["provider"]
      zone_domain = local.domain_validation_providers[dvo.domain_name]["zone_domain"]
    })
  ] : []
}
