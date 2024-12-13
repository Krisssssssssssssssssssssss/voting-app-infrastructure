resource aws_instance "vm" {
 
  ami = var.ami_image
 
  instance_type = var.instance_type
 
  tags = {
  "Name" = each.value
  "env"  = var.env
  }
 
  for_each = var.ec2_names
 
}
