#resource "aws_wafv2_web_acl" "this" {
#  name  = "${var.project_name}-${var.stage}-web-acl"
#  description = "Web ACL for ${var.project_name}-${var.stage}"
#  scope = "CLOUDFRONT"
#  provider = "aws.virginia"
#
#  default_action {
#      allow {}
#  }
#
#  rule {
#    name     = "rate-limit"
#    priority = 1
#
#    action {
#      block {}
#    }
#
#    statement {
#      rate_based_statement {
#        limit         = 1000
#        aggregate_key_type = "IP"
#      }
#    }
#
#    visibility_config {
#      cloudwatch_metrics_enabled = false
#      metric_name                = "rate-limit"
#      sampled_requests_enabled   = false
#    }
#  }
#
#  visibility_config {
#      cloudwatch_metrics_enabled = false
#      metric_name                = "${var.project_name}-web-acl"
#      sampled_requests_enabled   = false
#    }
#}