resource "aws_instance" "public_ec2" {
  ami                         = var.ami_image
  instance_type               = var.instance_type
  availability_zone           = "us-east-1a"
  vpc_security_group_ids      = [aws_security_group.public_security_group.id]
  subnet_id                   = aws_subnet.public_subnet.id
  associate_public_ip_address = true
  user_data                   = <<-EOF
        #!/bin/bash
        sudo apt update -y
        sudo apt install apache2 -y
        sudo systemctl start apache2
        sudo systemctl enable apache2
        echo "<html><body><h1>Hi there! This is Sunitha's public VM</h1></body></html>" > /var/www/html/index.html
        EOF


  tags = {
    Name = "sun_web1_instance"
  }
}

resource "aws_instance" "private_ec2" {

  ami                    = var.ami_image
  instance_type          = var.instance_type
  availability_zone      = "us-east-1b"
  vpc_security_group_ids = [aws_security_group.private_security_group.id]
  subnet_id              = aws_subnet.private_subnet.id
  user_data              = <<-EOF
        #!/bin/bash
         #!/bin/bash
        sudo apt update -y
        sudo apt install apache2 -y
        sudo systemctl start apache2
        sudo systemctl enable apache2
        echo "<html><body><h1>Hi there</h1></body></html>" > /var/www/html/index.html
        EOF


  tags = {
    Name = "sun_web2_instance"
  }
}
