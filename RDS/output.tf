output database_name {
    description = "Database name"
    value = var.db_name

}
output identifier {
   description = "The name of the RDS Instance"
   value = var.identifier
}


output "endpoint" {
  description = "The actual endpoint for the database."
  value       = aws_db_instance.sanjay_db_instance.endpoint
}