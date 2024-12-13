variable "cidr_block" {
  type        = string
  description = " CIDR block for VPC"
  default     = "10.0.0.0/16"
}

variable "vpc_name" {
  type        = string
  default     = "KSD_Custom_VPC"
  description = "Name of the custom VPC"
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

variable "vpc_region" {
  type        = string
  default     = "ap-south-1"
  description = "Region for the custom VPC"
}

variable "subnets" {
  description = "Subnets configuration for the custom VPC"
  type = map(object({
    cidr_block = string
    az         = string
    is_public  = bool
  }))
  default = {
    public = {
      cidr_block = "10.0.1.0/24"
      az         = "ap-south-1a"
      is_public  = true
    }
    private_1 = {
      cidr_block = "10.0.2.0/24"
      az         = "ap-south-1b"
      is_public  = false
    }
    private_2 = {
      cidr_block = "10.0.3.0/24"
      az         = "ap-south-1c"
      is_public  = false
    }
    private_3 = {
      cidr_block = "10.0.4.0/24"
      az         = "ap-south-1a"
      is_public  = false
    }
  }
}
