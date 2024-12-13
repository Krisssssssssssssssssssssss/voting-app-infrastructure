region = "ap-south-1"

availability_zone = {
  private_subnet_az = "us-east-1b"
  public_subnet_az  = "us-east-1a"
}

cidr_block = "10.0.0.0/16"

vpc_name = "myVpc-suni"

public_subnet_cidr_block = "10.0.1.0/24"

private_subnet_cidr_block = "10.0.2.0/24"

instance_type = "t2.medium"

ami_image= "ami-0614680123427b75e"

ec2_names = [  "frontend-vt-rs-ec2", "backend-rd-wk-ec2", "db-ps-ec2" ]
security_groups = [ "aws_security_group.vote_result_sg.id", "aws_security_group.redis_worker_sg.id" ,"aws_security_group.postgres_sg.id" ]