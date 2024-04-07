resource "aws_s3_bucket" "example" {
  bucket = "munzirtestbucket"
}

resource "aws_s3_bucket_public_access_block" "example" {
  bucket = "munzirtestbucket"

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_ownership_controls" "munzir" {
  bucket = "munzirtestbucket"
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "examp" {
  depends_on = [aws_s3_bucket_ownership_controls.munzir]

  bucket = "munzirtestbucket"
  acl    = "public-read"
}

resource "aws_s3_object" "object" {
  bucket = "munzirtestbucket"
  key    = "index.html"
  source = "index.html"
  content_type = "text/html"
  acl    = "public-read"
}

resource "aws_s3_bucket_website_configuration" "example" {
  bucket = "munzirtestbucket"

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "index.html"
  }

}
