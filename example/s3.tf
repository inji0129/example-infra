resource "aws_s3_bucket" "serverless" {
  bucket = "${var.project_name}-${var.stage}-in-serverless"

  tags = {
    Name = "${var.project_name}-${var.stage}-in-serverless"
  }
}