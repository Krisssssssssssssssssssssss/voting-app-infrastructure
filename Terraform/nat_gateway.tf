# Elastic IP for NAT Gateway
resource "aws_eip" "nat" {
  #vpc = true

  tags = {
    Name = "${var.vpc_name}-NAT-EIP"
  }
}

# NAT Gateway
resource "aws_nat_gateway" "main" {
  allocation_id = aws_eip.nat.id
  subnet_id = aws_subnet.main["public1"].id

  tags = {
    Name = "${var.vpc_name}-NAT"
  }
}

# Private Route Table Route to NAT Gateway
resource "aws_route" "private_route" {
  route_table_id         = aws_route_table.private.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.main.id
}
