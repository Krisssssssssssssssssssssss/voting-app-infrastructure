resource "aws_security_group" "frontend_sg" {
  name        = "allow_frontend_traffic"
  description = "Allow traffic to and from the frontend EC2 instances"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "Allow HTTP traffic from ALB"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    security_groups = [aws_security_group.alb_sg.id]
  }

  egress {
    description = "Allow traffic to backend services (Redis/Worker)"
    from_port   = 6379
    to_port     = 6379
    protocol    = "tcp"
    cidr_blocks = [
      aws_subnet.main["private_1"].cidr_block,
      aws_subnet.main["private_2"].cidr_block
    ]
  }

  tags = {
    Name = "frontend_sg"
  }
}
