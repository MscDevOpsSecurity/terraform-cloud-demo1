variable "aws_region" {
  default     = "us-east-1"
  description = "Default AWS region"
}

variable "instance_type" {
  type        = string
  description = "EC2 Instance Type - Instance Sizing"
  default     = "t2.micro"
}
