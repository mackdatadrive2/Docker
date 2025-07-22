variable "aws_region" {
  default     = "us-east-1"
}

data "aws_vpc" "GetVPC" {
filter {
    name   = "tag:Name"
    values = ["CustomVPC"]
  }
}

data "aws_subnet" "GetSubnet" {
filter {
    name   = "tag:Name"
    values = ["PublicSubnet1"]
  }
}