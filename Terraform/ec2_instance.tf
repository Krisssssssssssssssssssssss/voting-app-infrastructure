# resource "aws_instance" "frontend" {
#   ami           = var.ami_image                   
#   instance_type = var.instance_type               
#   subnet_id     = aws_subnet.main["private_1"].id 

#   # Attach the frontend security group
#   vpc_security_group_ids = [aws_security_group.frontend_sg.id]

#   # Associate the KDS_kp key pair
#   key_name = "KDS_kp"

#   # Tags for organization
#   tags = {
#     Name = "frontend-vote-result-ec2"
#     Env  = var.env
#   }
# }

# resource "aws_instance" "backend" {
#   ami           = var.ami_image                   
#   instance_type = var.instance_type               
#   subnet_id     = aws_subnet.main["private_3"].id

#   # Attach the backend security group
#   vpc_security_group_ids = [aws_security_group.redis_worker_sg.id]

#   # Associate the KDS_kp key pair
#   key_name = "KDS_kp"

#   tags = {
#     Name = "backend-redis-worker-ec2"
#     Env  = var.env
#   }
# }

# resource "aws_instance" "database" {
#   ami           = var.ami_image                   
#   instance_type = var.instance_type               
#   subnet_id     = aws_subnet.main["private_3"].id 

#   # Attach the database security group
#   vpc_security_group_ids = [aws_security_group.postgres_sg.id]

#   # Associate the KDS_kp key pair
#   key_name = "KDS_kp"

#   tags = {
#     Name = "database-ec2"
#     Env  = var.env
#   }
# }
