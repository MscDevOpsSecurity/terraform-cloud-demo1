variable "aws-region" {
  default     = "us-east-2"
  description = "Default AWS region"
}

variable "instance_type" {
  type        = string
  description = "EC2 Instance Type - Instance Sizing"
  default     = "t2.micro"
}
