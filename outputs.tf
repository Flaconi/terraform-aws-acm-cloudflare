output "acm_certificate_arn" {
  description = "The ARN of the certificate"
  value       = var.create_certificate ? aws_acm_certificate.this[0].arn : null
}
