resource "aws_s3_bucket" "sanjay-demo-bucket" {
  bucket_prefix = var.bucket_prefix
  acl    = var.acl

  object_lock_enabled = var.object_lock_enabled
  
  versioning {
    enabled = var.versioning
  }
 
  tags = var.tags
}


/*(resource "aws_s3_bucket_object" "demofile"{
  bucket = ""
  key = "Teacher upload sample"
  source = "C:\\Users\\sanjay\\Downloads\\Teacher upload sample.txt"
  etag = filemd5("C:\\Users\\sanjay\\Downloads\\Teacher upload sample.txt")

}*/

/*resource "null_resource" "multipleFiles" {
  provisioner "local-exec" {
    command = "aws s3 sync ${path.module}/s3Contents s3://${aws_s3_bucket.site.id}"
  }
}*/


