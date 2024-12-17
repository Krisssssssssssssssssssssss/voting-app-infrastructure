region = "ap-south-1"

availability_zone = {
  public_subnet_az  = "ap-south-1a"
  private_subnet_az = "ap-south-1b"
}

cidr_block = "10.0.0.0/16"

vpc_name = "kri-KSD_VPC"

vpc_id = "vpc-0dc989d432f85d193"

instance_type = "t2.micro"

ami_image= "ami-053b12d3152c0cc71"

ec2_names = [  "kri-frontend-vt-rs-ec2", "kri-backend-rd-wk-ec2", "kri-db-ps-ec2" ]
 security_groups = [ "kri-aws_security_group.vote_result_sg.id", "kri-aws_security_group.redis_worker_sg.id" ,"kri-aws_security_group.postgres_sg.id" ]