resource "aws_cognito_user_pool" "pool" {
  name = "${var.project_name}-${var.stage}-user-pool"

  username_attributes = [
    "email"
  ]
  auto_verified_attributes = [
    "email"
  ]

  account_recovery_setting {
    recovery_mechanism {
      name = "verified_email"
      priority = 1
    }
  }

  user_attribute_update_settings {
    attributes_require_verification_before_update = ["email"]
  }

  email_configuration {
    reply_to_email_address = "siu9068@gmail.om"
  }

  deletion_protection = "INACTIVE"
}

resource "aws_cognito_user_pool_client" "client" {
  name = "${var.project_name}-${var.stage}-user-pool-client"

  user_pool_id = aws_cognito_user_pool.pool.id

  explicit_auth_flows = [
    "ALLOW_USER_SRP_AUTH",
    "ALLOW_REFRESH_TOKEN_AUTH"
  ]
  generate_secret = true

  callback_urls = [
    "http://localhost:5001/api/v1/auth/token"
  ]
  allowed_oauth_flows = ["code"]
  allowed_oauth_flows_user_pool_client = true
  allowed_oauth_scopes = ["email", "openid", "aws.cognito.signin.user.admin"]
  supported_identity_providers = ["COGNITO"]
#  supported_identity_providers = ["COGNITO","Google"]
}

#resource "aws_cognito_identity_provider" "google_provider" {
#  user_pool_id  = aws_cognito_user_pool.pool.id
#  provider_name = "Google"
#  provider_type = "Google"
#
#  provider_details = {
#    authorize_scopes = "email"
#    client_id        = "your client_id"
#    client_secret    = "your client_secret"
#  }
#
#  attribute_mapping = {
#    email    = "email"
#    username = "sub"
#  }
#}

resource "aws_cognito_user_pool_domain" "main" {
  domain       = "${var.project_name}-${var.stage}-domain"
  user_pool_id = aws_cognito_user_pool.pool.id
}

