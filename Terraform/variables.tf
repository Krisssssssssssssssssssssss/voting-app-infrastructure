variable "cidr_block" {
  type        = string
  description = " CIDR block for VPC"
  default     = "10.0.0.0/16"
}

variable "vpc_name" {
  type        = string
  description = "VPC Name"
}

variable "public_subnet_cidr_block" {
  type        = string
  default     = "10.0.1.0/24"
  description = "cidr range for public subnet"

}

variable "private_subnet_cidr_block" {
  type        = string
  default     = "10.0.2.0/24"
  description = "cidr range for private subnet"

}

variable "region" {
  type        = string
  default     = "ap-south-1"
  description = "default region where infrastructures will be provisioned"
}

variable "availability_zone" {

  type = map(string)

  default = {
    public_subnet_az  = "ap-south-1a"
    private_subnet1_az = "ap-south-1b"
    private_subnet2_az = "ap-south-1c"
    
  }

}

variable "ami_image" {

  type = string
  default = "ami-0614680123427b75e"

}

variable "instance_type" {

  type = string

  default = "t2.micro"

}
variable "ec2_names" {
    description = "To define ec2 instance name"
    type = set(string)

}

variable "env" {
    default = "prod"
    description = "To specify environment"
    type = string
  
}