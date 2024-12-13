region = "ap-south-1"

availability_zone = {
  private_subnet_az = "us-east-1b"
  public_subnet_az  = "us-east-1a"
}

cidr_block = "10.0.0.0/16"

vpc_name = "KSD_VPC"

instance_type = "t2.medium"

ami_image= "ami-0614680123427b75e"

ec2_names = [  "frontend-vt-rs-ec2", "backend-rd-wk-ec2", "db-ps-ec2" ]