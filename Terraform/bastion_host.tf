resource "aws_security_group" "bastion_sg" {
  name        = "bastion_sg"
  description = "Allow SSH access to the bastion host"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "Allow SSH for EC2 Instance Connect"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "bastion_sg"
  }
}
