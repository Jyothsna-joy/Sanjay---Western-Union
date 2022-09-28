output "arn" {
  value = aws_kms_alias.test-KMS-key.arn
}

output "target_key_arn" {
  value = aws_kms_alias.test-KMS-key.target_key_arn
}
