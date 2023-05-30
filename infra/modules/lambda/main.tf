terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 2.7.0"
    }
  }
}

data "archive_file" "zip" {
  type        = "zip"
  source_dir = "${path.cwd}/${var.local_path}"
  output_path = "${path.cwd}/deploy/${var.lambda_name}.zip"
}

resource "aws_lambda_function" "lambda" {
  function_name    = var.lambda_name
  filename         = data.archive_file.zip.output_path
  source_code_hash = data.archive_file.zip.output_base64sha256
  role    = var.assume_role_policy
  handler = "index.handler"
  runtime = "nodejs18.x"
}
