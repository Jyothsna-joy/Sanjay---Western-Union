resource "aws_db_instance" "sanjay_db_instance" {
  
  allocated_storage                     = var.allocated_storage 
  engine                                = var.engine 
  engine_version                        = var.engine_version
  instance_class                        = var.instance_class
  db_name                               = var.db_name
  username                              = var.username 
  password                              = var.password 
  ca_cert_identifier                    = var.ca_cert_identifier
  skip_final_snapshot                   = var.skip_final_snapshot
  backup_retention_period               = var.backup_retention_period 
  availability_zone                     = var.availability_zone
  backup_window                         = var.backup_window 
  port                                  = var.port 
  storage_type                          = var.storage_type 
  identifier                            = var.identifier
}