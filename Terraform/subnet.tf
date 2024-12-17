resource "aws_subnet" "main" {
  for_each = var.subnets

  vpc_id                  = aws_vpc.main.id
  cidr_block              = each.value.cidr_block
  availability_zone       = each.value.az
  map_public_ip_on_launch = each.value.is_public

  tags = {
    Name = "kri-${var.vpc_name}-Subnet-${each.key}"
  }
}
