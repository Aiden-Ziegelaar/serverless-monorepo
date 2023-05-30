provider "aws" {
  region = "ap-southeast-2"
}

provider "archive" {}

data "aws_iam_policy_document" "policy" {
  statement {
    sid    = ""
    effect = "Allow"
    principals {
      identifiers = ["lambda.amazonaws.com"]
      type        = "Service"
    }
    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "lambda_iam_role" {
  name               = "lambda_iam_role"
  assume_role_policy = data.aws_iam_policy_document.policy.json
}

module "lambda" {
  source = "./modules/lambda"
  for_each = fileset(path.cwd, "dist/*/index.js")
  lambda_name = index(split(each.value, "/"), 1)
  local_path = "dist/${index(split(each.value, "/"), 1)}/*"
  assume_role_policy = aws_iam_role.lambda_iam_role.arn
  tags = {
    Name = "lambda"
  }
}
