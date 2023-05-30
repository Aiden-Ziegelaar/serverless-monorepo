# Output variable definitions

output "arn" {
  description = "ARN of the lambda"
  value       = aws_lambda_function.lambda.arn
}

output "name" {
  description = "name"
  value       = aws_lambda_function.lambda.function_name
}
