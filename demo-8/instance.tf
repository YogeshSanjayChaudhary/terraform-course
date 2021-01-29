resource "aws_instance" "stepapp" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = "t2.micro"
  tags = {
    Name = "stepapp-dev-webserver"
}
  # the VPC subnet
  subnet_id = var.SUBNET_ID

  # the security group
  vpc_security_group_ids = [aws_security_group.allow-ssh.id]

  # the public SSH key
  key_name = aws_key_pair.mykey.key_name
}

