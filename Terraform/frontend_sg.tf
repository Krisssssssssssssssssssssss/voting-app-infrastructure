resource "aws_security_group" "frontend_sg" {
  name        = "allow_frontend_traffic"
  description = "Allow traffic to and from the frontend EC2 instances"
  vpc_id      = aws_vpc.main.id

  ingress {
    description     = "Allow HTTP traffic from ALB"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.alb_sg.id]
  }
  ingress {
  description     = "Allow SSH from Bastion Host"
  from_port       = 22
  to_port         = 22
  protocol        = "tcp"
  security_groups = [aws_security_group.bastion_sg.id]
}

  egress {
    description = "Allow outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "frontend_sg"
  }
}
