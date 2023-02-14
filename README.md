# Terraform module: AWS Certificate manager with Cloudflare validation

[![lint](https://github.com/flaconi/terraform-aws-acm-cloudflare/workflows/lint/badge.svg)](https://github.com/flaconi/terraform-aws-acm-cloudflare/actions?query=workflow%3Alint)
[![test](https://github.com/flaconi/terraform-aws-acm-cloudflare/workflows/test/badge.svg)](https://github.com/flaconi/terraform-aws-acm-cloudflare/actions?query=workflow%3Atest)
[![Tag](https://img.shields.io/github/tag/flaconi/terraform-aws-acm-cloudflare.svg)](https://github.com/flaconi/terraform-aws-acm-cloudflare/releases)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/licenses/MIT)

Create ACM certificate with DNS validation and validate using Cloudflare Hosted Zone

<!-- TFDOCS_HEADER_START -->


<!-- TFDOCS_HEADER_END -->

<!-- TFDOCS_PROVIDER_START -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 3 |
| <a name="provider_cloudflare"></a> [cloudflare](#provider\_cloudflare) | >= 3.2, <= 3.32.0 |

<!-- TFDOCS_PROVIDER_END -->

<!-- TFDOCS_REQUIREMENTS_START -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12.26 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3 |
| <a name="requirement_cloudflare"></a> [cloudflare](#requirement\_cloudflare) | >= 3.2, <= 3.32.0 |

<!-- TFDOCS_REQUIREMENTS_END -->

<!-- TFDOCS_INPUTS_START -->
## Required Inputs

The following input variables are required:

### <a name="input_cloudflare_api_token"></a> [cloudflare\_api\_token](#input\_cloudflare\_api\_token)

Description: The Cloudflare API token.

Type: `string`

### <a name="input_zone_name"></a> [zone\_name](#input\_zone\_name)

Description: The Name of the zone to contain this record.

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_create_certificate"></a> [create\_certificate](#input\_create\_certificate)

Description: Whether to create ACM certificate

Type: `bool`

Default: `true`

### <a name="input_validate_certificate"></a> [validate\_certificate](#input\_validate\_certificate)

Description: Whether to validate certificate by creating DNS record

Type: `bool`

Default: `true`

### <a name="input_validation_allow_overwrite_records"></a> [validation\_allow\_overwrite\_records](#input\_validation\_allow\_overwrite\_records)

Description: Whether to allow overwrite of Route53 records

Type: `bool`

Default: `true`

### <a name="input_wait_for_validation"></a> [wait\_for\_validation](#input\_wait\_for\_validation)

Description: Whether to wait for the validation to complete

Type: `bool`

Default: `true`

### <a name="input_certificate_transparency_logging_preference"></a> [certificate\_transparency\_logging\_preference](#input\_certificate\_transparency\_logging\_preference)

Description: Specifies whether certificate details should be added to a certificate transparency log

Type: `bool`

Default: `true`

### <a name="input_domain_name"></a> [domain\_name](#input\_domain\_name)

Description: A domain name for which the certificate should be issued

Type: `string`

Default: `""`

### <a name="input_subject_alternative_names"></a> [subject\_alternative\_names](#input\_subject\_alternative\_names)

Description: A list of domains that should be SANs in the issued certificate

Type: `list(string)`

Default: `[]`

### <a name="input_tags"></a> [tags](#input\_tags)

Description: A mapping of tags to assign to the resource

Type: `map(string)`

Default: `{}`

### <a name="input_dns_ttl"></a> [dns\_ttl](#input\_dns\_ttl)

Description: The TTL of DNS recursive resolvers to cache information about this record.

Type: `number`

Default: `120`

<!-- TFDOCS_INPUTS_END -->

<!-- TFDOCS_OUTPUTS_START -->
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_acm_certificate_arn"></a> [acm\_certificate\_arn](#output\_acm\_certificate\_arn) | The ARN of the certificate |
| <a name="output_acm_certificate_domain_validation_options"></a> [acm\_certificate\_domain\_validation\_options](#output\_acm\_certificate\_domain\_validation\_options) | A list of attributes to feed into other resources to complete certificate validation. Can have more than one element, e.g. if SANs are defined. |
| <a name="output_distinct_domain_names"></a> [distinct\_domain\_names](#output\_distinct\_domain\_names) | List of distinct domains names used for the validation. |
| <a name="output_validation_dns_record_fqdns"></a> [validation\_dns\_record\_fqdns](#output\_validation\_dns\_record\_fqdns) | List of FQDNs built using the zone domain and name. |
| <a name="output_validation_domains"></a> [validation\_domains](#output\_validation\_domains) | List of distinct domain validation options. This is useful if subject alternative names contain wildcards. |

<!-- TFDOCS_OUTPUTS_END -->


## License

**[MIT License](LICENSE)**

Copyright (c) 2021 **[Flaconi GmbH](https://github.com/flaconi)**
