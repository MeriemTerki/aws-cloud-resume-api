

# IAM Role for Lambda Execution
resource "aws_iam_role" "lambda_exec" {
  name = "lambda_execution_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })
}

# IAM Policy Attachment for DynamoDB Access
resource "aws_iam_role_policy_attachment" "lambda_dynamodb" {
  role       = aws_iam_role.lambda_exec.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonDynamoDBReadOnlyAccess"
}

# Lambda Function
resource "aws_lambda_function" "resume_function" {
  function_name = "resume_function"
  role          = aws_iam_role.lambda_exec.arn
  handler       = "lambda_function.lambda_handler" # Update this if your handler function is different
  runtime       = "python3.9"
  filename      = "src/lambda_function.zip" # Path to your zipped Lambda function code

  source_code_hash = filebase64sha256("src/lambda_function.zip")
}

# API Gateway Rest API
resource "aws_api_gateway_rest_api" "resume_api" {
  name = "resume_api"
}

# API Gateway Resource
resource "aws_api_gateway_resource" "root" {
  rest_api_id = aws_api_gateway_rest_api.resume_api.id
  parent_id   = aws_api_gateway_rest_api.resume_api.root_resource_id
  path_part   = "resume"
}

# API Gateway Method
resource "aws_api_gateway_method" "get_resume" {
  rest_api_id   = aws_api_gateway_rest_api.resume_api.id
  resource_id   = aws_api_gateway_resource.root.id
  http_method   = "GET"
  authorization = "NONE"
}

# API Gateway Integration
resource "aws_api_gateway_integration" "lambda_integration" {
  rest_api_id             = aws_api_gateway_rest_api.resume_api.id
  resource_id             = aws_api_gateway_resource.root.id
  http_method             = aws_api_gateway_method.get_resume.http_method
  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = "arn:aws:apigateway:${data.aws_region.current.name}:lambda:path/2015-03-31/functions/${aws_lambda_function.resume_function.arn}/invocations"
}

# Lambda Permission for API Gateway
resource "aws_lambda_permission" "api_gateway" {
  statement_id  = "AllowAPIGatewayInvoke"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.resume_function.function_name
  principal     = "apigateway.amazonaws.com"
}

# API Gateway Deployment
resource "aws_api_gateway_deployment" "api_deployment" {
  depends_on = [
    aws_api_gateway_integration.lambda_integration
  ]
  rest_api_id = aws_api_gateway_rest_api.resume_api.id
  stage_name  = "prod"
}

# Outputs
output "api_url" {
  value = "https://${aws_api_gateway_rest_api.resume_api.id}.execute-api.${data.aws_region.current.name}.amazonaws.com/prod/resume"
}

# Data Source for AWS Region
data "aws_region" "current" {}
