variable "r53_domain_name" {
  type        = string
  description = "Route 53 public domain name."
}

variable "region" {
  type        = string
  description = "AWS region; us-east-1 is default since Route 53 is global."
  default     = "us-east-1"
}

variable "cert_fqdn" {
  type        = string
  description = "FQDN for the certificate that will be generated."
}

variable "email_address" {
  type        = string
  description = "Email address that will be associated with the ACME registration."
}

variable "pre_check_delay" {
  type        = number
  description = "Insert a delay after every DNS challenge record to allow for extra time for DNS propagation before the certificate is requested."
  default     = 20
}
