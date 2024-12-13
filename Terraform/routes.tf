resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = {
    Name = "${var.vpc_name}-Public-RT"
  }
}

# Associate Public Subnet with Public Route Table
resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.main["public1"].id
  route_table_id = aws_route_table.public.id
}

# Private Route Table
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.vpc_name}-Private-RT"
  }
}

# Private Route Table Associations
resource "aws_route_table_association" "private" {
  for_each = { for key, subnet in aws_subnet.main : key => subnet if !var.subnets[key].is_public }

  subnet_id      = each.value.id
  route_table_id = aws_route_table.private.id
}
