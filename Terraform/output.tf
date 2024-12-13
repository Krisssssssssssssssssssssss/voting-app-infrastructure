output "all_public_ips" {
  
  value = { for key, instance in aws_instance.vm : key => instance.public_ip }
  }
