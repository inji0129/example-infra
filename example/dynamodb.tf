#resource "aws_dynamodb_table" "user-table" {
#  name     = "user"
#  hash_key = "id"
#  read_capacity = 1
#  write_capacity = 1
#  billing_mode = "PROVISIONED"
#
#  attribute {
#      name = "id"
#      type = "S"
#  }
#
#  tags = {
#    Name = "${var.stage}-user-table"
#    environment = "${var.stage}"
#  }
#
#  lifecycle {
#    ignore_changes = [read_capacity, write_capacity]
#  }
#}