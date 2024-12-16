region = "ap-south-1"

availability_zone = {
  private_subnet_az = "us-east-1b"
  public_subnet_az  = "us-east-1a"
}

cidr_block = "10.0.0.0/16"

vpc_name = "KSD_VPC"

vpc_id = "vpc-0dc989d432f85d193"

# instance_type = "t2.micro"

# ami_image= "ami-053b12d3152c0cc71"

# ec2_names = [  "frontend-vt-rs-ec2", "backend-rd-wk-ec2", "db-ps-ec2" ]
# security_groups = [ "aws_security_group.vote_result_sg.id", "aws_security_group.redis_worker_sg.id" ,"aws_security_group.postgres_sg.id" ]