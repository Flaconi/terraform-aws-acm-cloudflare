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

No providers.

<!-- TFDOCS_PROVIDER_END -->

<!-- TFDOCS_REQUIREMENTS_START -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12.26 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3 |
| <a name="requirement_cloudflare"></a> [cloudflare](#requirement\_cloudflare) | ~> 3.1.0 |

<!-- TFDOCS_REQUIREMENTS_END -->

<!-- TFDOCS_INPUTS_START -->
## Required Inputs

The following input variables are required:

### <a name="input_api_token"></a> [api\_token](#input\_api\_token)

Description: The Cloudflare API token.

Type: `string`

## Optional Inputs

No optional inputs.

<!-- TFDOCS_INPUTS_END -->

<!-- TFDOCS_OUTPUTS_START -->
## Outputs

No outputs.

<!-- TFDOCS_OUTPUTS_END -->


## License

**[MIT License](LICENSE)**

Copyright (c) 2021 **[flaconi](https://github.com/flaconi)**
