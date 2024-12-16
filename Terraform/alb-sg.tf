# resource "aws_security_group" "alb_sg" {
#   name        = "allow_alb_traffic"
#   description = "Allow traffic to and from the ALB"
#   vpc_id      = aws_vpc.main.id

#   ingress {
#     description = "Allow HTTP traffic from the internet"
#     from_port   = 80
#     to_port     = 80
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   ingress {
#     description = "Allow HTTPS traffic from the internet"
#     from_port   = 443
#     to_port     = 443
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   egress {
#     description = "Allow traffic to frontend EC2 instances"
#     from_port   = 80
#     to_port     = 80
#     protocol    = "tcp"
#     cidr_blocks = [aws_subnet.main["public1"].cidr_block]
#   }

#   tags = {
#     Name = "alb_sg"
#   }
# }
