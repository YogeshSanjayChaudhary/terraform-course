# nat gw
resource "aws_eip" "stepapp-dev-nat" {
  vpc = true
}

resource "aws_nat_gateway" "stepapp-dev-nat-gw" {
  allocation_id = aws_eip.stepapp-dev-nat.id
  subnet_id     = aws_subnet.stepapp-dev-public-1a.id
  depends_on    = [aws_internet_gateway.stepapp-dev-igw]
}

# VPC setup for NAT
resource "aws_route_table" "stepapp-dev-private-rt" {
  vpc_id = aws_vpc.stepapp-dev-vpc.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.stepapp-dev-nat-gw.id
  }

  tags = {
    Name = "stepapp-dev-private-rt"
  }
}

# route associations private
resource "aws_route_table_association" "stepapp-dev-private-1a" {
  subnet_id      = aws_subnet.stepapp-dev-private-1a.id
  route_table_id = aws_route_table.stepapp-dev-private-rt.id
}

resource "aws_route_table_association" "stepapp-dev-private-1b" {
  subnet_id      = aws_subnet.stepapp-dev-private-1b.id
  route_table_id = aws_route_table.stepapp-dev-private-rt.id
}

