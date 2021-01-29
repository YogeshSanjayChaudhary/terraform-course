variable "AWS_REGION" {
  default = "ap-south-1"
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "mykey"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "mykey.pub"
}

variable "SUBNET_ID" {
  default = "subnet-0c095deead6a5a3b3"
}

variable "VPC_ID" {
  default = "vpc-07da17a91ad47389e"
}

variable "AMIS" {
  type = map(string)
  default = {
    ap-south-1 = "ami-04b1ddd35fd71475a"
  }
}

