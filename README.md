# Terraform config for a LetsEncrypt certificate with AWS Route 53 domain validation

This Terraform configuration will request a TLS certificate from LetsEncrypt, using AWS Route 53 for DNS-based validation.

Requirements:

1. A public hosted DNS zone in Amazon Route 53.
1. AWS credentials with permissions to create Route 53 records. See the [authentication docs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs#authentication-and-configuration) for the AWS provider.

The certificate files will be created locally and also as Terraform outputs. Note the private key will be included, so run this somewhere secure.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.4.0 |
| <a name="requirement_acme"></a> [acme](#requirement\_acme) | >= 2.13.1 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.6.0 |
| <a name="requirement_local"></a> [local](#requirement\_local) | >= 2.4.0 |
| <a name="requirement_tls"></a> [tls](#requirement\_tls) | >= 4.0.4 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_acme"></a> [acme](#provider\_acme) | >= 2.13.1 |
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.6.0 |
| <a name="provider_local"></a> [local](#provider\_local) | >= 2.4.0 |
| <a name="provider_tls"></a> [tls](#provider\_tls) | >= 4.0.4 |

## Resources

| Name | Type |
|------|------|
| [acme_certificate.certificate](https://registry.terraform.io/providers/vancluever/acme/latest/docs/resources/certificate) | resource |
| [acme_registration.reg](https://registry.terraform.io/providers/vancluever/acme/latest/docs/resources/registration) | resource |
| [local_file.private_key](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |
| [local_file.pub_key_chain](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |
| [local_file.pub_key_no_root](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |
| [tls_private_key.acme_reg](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/private_key) | resource |
| [aws_route53_zone.r53](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/route53_zone) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cert_fqdn"></a> [cert\_fqdn](#input\_cert\_fqdn) | FQDN for the certificate that will be generated. | `string` | n/a | yes |
| <a name="input_email_address"></a> [email\_address](#input\_email\_address) | Email address that will be associated with the ACME registration. | `string` | n/a | yes |
| <a name="input_r53_domain_name"></a> [r53\_domain\_name](#input\_r53\_domain\_name) | Route 53 public domain name. | `string` | n/a | yes |
| <a name="input_pre_check_delay"></a> [pre\_check\_delay](#input\_pre\_check\_delay) | Insert a delay after every DNS challenge record to allow for extra time for DNS propagation before the certificate is requested. | `number` | `20` | no |
| <a name="input_region"></a> [region](#input\_region) | AWS region; us-east-1 is default since Route 53 is global. | `string` | `"us-east-1"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_certificate_issuer_pem"></a> [certificate\_issuer\_pem](#output\_certificate\_issuer\_pem) | Certificate issuer. |
| <a name="output_certificate_url"></a> [certificate\_url](#output\_certificate\_url) | Certificate URL. |
| <a name="output_private_key"></a> [private\_key](#output\_private\_key) | Private key contents. |
| <a name="output_private_key_location"></a> [private\_key\_location](#output\_private\_key\_location) | Path where the private key was exported on disk |
| <a name="output_pub_key"></a> [pub\_key](#output\_pub\_key) | Public key file from the acme\_generation. |
| <a name="output_pub_key_chain"></a> [pub\_key\_chain](#output\_pub\_key\_chain) | Public key certificate. |
| <a name="output_public_key_location"></a> [public\_key\_location](#output\_public\_key\_location) | Path where the private key was exported on disk. |
<!-- END_TF_DOCS -->