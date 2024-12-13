# resource "aws_instance" "vm" {
#   # Use zipmap to combine ec2_names and security_groups into a map
#   for_each = zipmap(var.ec2_names, var.security_groups)

#   ami           = var.ami_image
#   instance_type = var.instance_type
#   key_name      = "KDS_kp.pem"  # Ensure this key pair exists

#   # Correctly referencing the security group ID for each instance
#   security_groups = [each.value]  # Use each.value to get the security group ID

#   tags = {
#     "Name" = each.key  # Use each.key for the EC2 instance name
#     "env"  = var.env
#   }
# }
