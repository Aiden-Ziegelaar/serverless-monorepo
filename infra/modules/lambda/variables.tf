# Input variable definitions

variable "lambda_name" {
  description = "Name of the lambda function. Must be unique."
  type        = string
}

variable "tags" {
  description = "Tags to set on the lambda function."
  type        = map(string)
  default     = {}
}

variable "local_path" {
  description = "Path to the lambda function code."
  type        = string
}

variable "assume_role_policy" {
  description = "IAM policy document for the lambda function's role."
  type        = string
}
