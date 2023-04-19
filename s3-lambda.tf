# IAM for Lambda
resource "aws_iam_role" "iam_for_lambda" {
  name = "iam_for_lambda"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

# Creating s3 bucket
module "s3_bucket" {
  source = "cloudposse/s3-bucket/aws"

  bucket_name    = "var.bucket_name"
  acl     = "private"
  enabled = "true"
}

# Avoding for_each loop as it can create an issue with trigger event
# Creating a PUBLIC lambda function
module "public_lambda" {
  source  = "cloudposse/lambda-function/aws"
  version = " ~> 0.4.1"

  s3_bucket = modeul.s3_bucket.bucket_id
  function_name = "public"
  runtime       = "nodejs"
  handler       = var.handler
  timeout       = "900"
  role          = aws_iam_role.iam_for_lambda.arn
}

# Creating a PRIVATE lambda function
module "private_lambda" {
  source  = "cloudposse/lambda-function/aws"
  version = " ~> 0.4.1"

  s3_bucket = modeul.s3_bucket.bucket_id
  function_name = "private"
  runtime       = "nodejs"
  handler       = var.handler
  timeout       = "900"
  role          = aws_iam_role.iam_for_lambda.arn
}

#Following event is to trigger the fucntion once new file is added to s3 bucket
# PUBLIC Trigger Event
resource "aws_s3_bucket_notification" "public-lambda-trigger" {
  bucket = module.s3_bucket.bucket_id
  lambda_function {
    lambda_function_arn = module.public_lambda.arn
    events              = ["s3:ObjectCreated:*"]
  }
}

# PRIVATE Trigger Event
resource "aws_s3_bucket_notification" "private-lambda-trigger" {
  bucket = module.s3_bucket.bucket_id
  lambda_function {
    lambda_function_arn = module.private_lambda.arn
    events              = ["s3:ObjectCreated:*"]
  }
}