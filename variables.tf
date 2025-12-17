variable "aws_region" {
  default = "ap-south-1"
}
variable "vpc_cidr" {
  default = "10.0.0.0/16"
}
variable "domain_name" {
  description = "Route53 hosted zone domain name"
  type        = string
}

