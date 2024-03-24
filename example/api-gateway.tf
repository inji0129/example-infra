resource "aws_apigatewayv2_api" "this" {
  name          = "${var.project_name}-${var.stage}-api"
  protocol_type = "HTTP"
}

resource "aws_apigatewayv2_integration" "this" {
  api_id           = aws_apigatewayv2_api.this.id
  integration_type = "HTTP_PROXY"
  payload_format_version = "2.0"
}

resource "aws_apigatewayv2_route" "default" {
  api_id    = aws_apigatewayv2_api.this.id
  route_key = "$default"
}

resource "aws_apigatewayv2_authorizer" "this" {
  api_id                            = aws_apigatewayv2_api.this.id
  authorizer_type                   = "JWT"
  jwt_configuration {
    audience = ["${aws_cognito_user_pool_client.client.id}"]
    issuer   = "https://cognito-idp.${var.aws_region}.amazonaws.com/${aws_cognito_user_pool.pool.id}"
  }
  identity_sources                  = ["$request.header.Authorization"]
  name                              = "${var.project_name}-${var.stage}-authorizer"
  authorizer_payload_format_version = "2.0"
}