terraform {
required_providers {
aws = {
    source = "hashicorp/aws"
    version = "~> 4.0"
}    
}  
}  

resource "aws_instance" "myinstance" {
  ami           = "ami-0022f774911c1d690"
  instance_type = "t2.micro"

  tags = {
    Name = "Demo EC2"
   }
    key_name = "dem-1234"
}
resource "aws_s3_bucket" "demobucket" {
  bucket = "tf-demo-buckett"
  acl = "private"

  tags = {
    Name        = "My Terraform bucket"
    Environment = "Dev-Env"
  }
}
resource "aws_db_instance" "sampledb" {
  allocated_storage    = 10
  engine               = "mysql"
  engine_version       = "8.0.28"
  instance_class       = "db.t3.micro"
  name                 = "mydemodb"
  username             = "admin"
  password             = "mydatabase"
  parameter_group_name = "default.mysql8.0"
  skip_final_snapshot  = true
}
resource "aws_vpc" "dev" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "dev-vpc"
  }
}
resource "aws_subnet" "sub" {
  vpc_id     = aws_vpc.dev.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "dev-subnet"
  }
}

