variable "project_name" {
  type        = string
  description = "project name"
}

variable "stage" {
  type        = string
  description = "stage step of project (dev, staging, prod)"
}

variable "aws_region" {
  type        = string
  default     = "ap-northeast-2"
  description = "AWS region"
}