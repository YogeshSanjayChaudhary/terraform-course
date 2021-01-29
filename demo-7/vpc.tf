# Internet VPC
resource "aws_vpc" "stepapp-dev-vpc" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  enable_classiclink   = "false"
  tags = {
    Name = "stepapp-dev-vpc"
  }
}

# Subnets
resource "aws_subnet" "stepapp-dev-public-1a" {
  vpc_id                  = aws_vpc.stepapp-dev-vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "ap-south-1a"

  tags = {
    Name = "stepapp-dev-public-1a"
  }
}

resource "aws_subnet" "stepapp-dev-public-1b" {
  vpc_id                  = aws_vpc.stepapp-dev-vpc.id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "ap-south-1b"

  tags = {
    Name = "stepapp-dev-public-1b"
  }
}

resource "aws_subnet" "stepapp-dev-private-1a" {
  vpc_id                  = aws_vpc.stepapp-dev-vpc.id
  cidr_block              = "10.0.3.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "ap-south-1a"

  tags = {
    Name = "stepapp-dev-private-1a"
  }
}

resource "aws_subnet" "stepapp-dev-private-1b" {
  vpc_id                  = aws_vpc.stepapp-dev-vpc.id
  cidr_block              = "10.0.4.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "ap-south-1b"

  tags = {
    Name = "stepapp-dev-private-1b"
  }
}

# Internet GW
resource "aws_internet_gateway" "stepapp-dev-igw" {
  vpc_id = aws_vpc.stepapp-dev-vpc.id

  tags = {
    Name = "stepapp-dev-igw"
  }
}

# route tables
resource "aws_route_table" "stepapp-dev-public-rt" {
  vpc_id = aws_vpc.stepapp-dev-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.stepapp-dev-igw.id
  }

  tags = {
    Name = "stepapp-dev-public-rt"
  }
}

# route associations public
resource "aws_route_table_association" "stepapp-dev-public-1a" {
  subnet_id      = aws_subnet.stepapp-dev-public-1a.id
  route_table_id = aws_route_table.stepapp-dev-public-rt.id
}

resource "aws_route_table_association" "stepapp-dev-public-1b" {
  subnet_id      = aws_subnet.stepapp-dev-public-1b.id
  route_table_id = aws_route_table.stepapp-dev-public-rt.id
}

