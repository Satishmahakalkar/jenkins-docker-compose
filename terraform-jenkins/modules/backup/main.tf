resource "aws_cloudwatch_event_rule" "daily_snapshot" {
  schedule_expression = "rate(1 day)"
}

resource "aws_lambda_function" "snapshot_lambda" {
  function_name = "EBS-Snapshot"
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.8"
  filename      = "lambda_function.zip"
  role          = aws_iam_role.lambda_role.arn
}

