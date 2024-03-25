resource "aws_apigatewayv2_api" "this" {
  name          = "${var.project_name}-${var.stage}-api"
  protocol_type = "HTTP"
}

#resource "aws_apigatewayv2_integration" "this" {
#  api_id           = aws_apigatewayv2_api.this.id
#  integration_type = "HTTP_PROXY"
#  payload_format_version = "2.0"
#
#  integration_uri = aws_lambda_function.example.invoke_arn
#}

#resource "aws_apigatewayv2_route" "default" {
#  api_id    = aws_apigatewayv2_api.this.id
#  route_key = "$default"
#
#  authorization_type = "JWT"
#  authorizer_id      = aws_apigatewayv2_authorizer.this.id
#}

resource "aws_apigatewayv2_stage" "this" {
  api_id = aws_apigatewayv2_api.this.id
  name   = "${var.project_name}-${var.stage}-stage"
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
}