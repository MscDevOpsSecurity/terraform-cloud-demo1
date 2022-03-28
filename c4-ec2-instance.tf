# Create key-pair
resource "tls_private_key" "my-rsa-key" {
  algorithm = "RSA"
}

resource "aws_key_pair" "my-key-pair" {
  key_name   = "my-key"
  public_key = tls_private_key.my-rsa-key.public_key_openssh

  depends_on = [ tls_private_key.my-rsa-key ]
}


# Create EC2 Instance - Amazon2 Linux
resource "aws_instance" "my-ec2-vm" {
  ami           = data.aws_ami.amzlinux.id 
  instance_type = var.instance_type
  count = 3
  key_name      = aws_key_pair.my-key-pair.key_name
  user_data = file("apache-install.sh")  
  vpc_security_group_ids = [aws_security_group.vpc-ssh.id, aws_security_group.vpc-web.id]
  tags = {
    "Name" = "Terraform-Cloud-${count.index}"
  }
}







