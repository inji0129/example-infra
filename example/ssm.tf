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

resource "aws_ssm_parameter" "cognito_user_pool_client_id" {
  name  = "${var.project_name}-${var.stage}-cognito-user-pool-client-id"
  description = "Cognito User Pool Client ID for ${var.project_name} ${var.stage}"
  type  = "SecureString"
  value = aws_cognito_user_pool_client.client.id
}

resource "aws_ssm_parameter" "cognito_user_pool_client_secret" {
  name  = "${var.project_name}-${var.stage}-cognito-user-pool-client-secret"
  description = "Cognito User Pool Client Secret for ${var.project_name} ${var.stage}"
  type  = "SecureString"
  value = aws_cognito_user_pool_client.client.client_secret
}

resource "aws_ssm_parameter" "cognito_domain_url" {
  name  = "${var.project_name}-${var.stage}-cognito-domain-url"
  description = "Cognito Domain URL for ${var.project_name} ${var.stage}"
  type  = "SecureString"
  value = aws_cognito_user_pool_domain.main.domain
}
