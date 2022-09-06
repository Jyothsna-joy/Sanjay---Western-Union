



resource "aws_cloud9_environment_ec2" "myenv" {

  name                        = var.name
  instance_type               = var.instance_type
  automatic_stop_time_minutes = var.automatic_stop_time_minutes
  connection_type             = var.connection_type
  description                 = var.description
  image_id                    = var.image_id
  owner_arn                   = var.owner_arn
  subnet_id                   = var.subnet_id

}