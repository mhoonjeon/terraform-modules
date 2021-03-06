 # S3 Bucket for backend
resource "aws_s3_bucket" "tfstate" {
  bucket = var.bucket_name

  versioning {
    enabled = true
  }
}

 # DynamoDB for fstate locking
resource "aws_dynamodb_table" "tfstate_lock" {
  hash_key = "LockID" #Primary Key is LockID
  name = var.dynamo_db_name
  read_capacity  = 1
  write_capacity = 1

  attribute {
    name = "LockID"
    type = "S"
  }
}

