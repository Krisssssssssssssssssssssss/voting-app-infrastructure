resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "kri-${var.vpc_name}-IGW"
  }
}