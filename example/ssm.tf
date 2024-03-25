resource "aws_ssm_parameter" "api_gateway_id" {
  name  = "${var.project_name}-${var.stage}-api-gateway-id"
  description = "API Gateway ID for ${var.project_name} ${var.stage}"
  type  = "SecureString"
  value = aws_apigatewayv2_api.this.id
}

resource "aws_ssm_parameter" "api_gateway_authorizer_id" {
  name  = "${var.project_name}-${var.stage}-api-gateway-authorizer-id"
  description = "API Gateway Authorizer ID for ${var.project_name} ${var.stage}"
  type  = "SecureString"
  value = aws_apigatewayv2_authorizer.this.id
}

