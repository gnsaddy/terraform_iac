# used to create resources in aws

# resource for RSA
resource "tls_private_key" "rsa" {
  algorithm = var.aws_key_pair["algorithm_name"]
  rsa_bits  = var.aws_key_pair["rsa_bits"]
}

# resource for aws key pair
resource "aws_key_pair" "ec2-example-key" {
  key_name   = var.aws_key_pair["key_name"]
  public_key = tls_private_key.rsa.public_key_openssh
}

# # remove old key pair from local workspace
resource "local_file" "delete_old_key_pair" {
  filename = var.aws_key_pair["key_filename"]
  content  = tls_private_key.rsa.private_key_pem
  depends_on = [
    aws_key_pair.ec2-example-key
  ]
  provisioner "local-exec" {
    command = "rm -f ${var.aws_key_pair["key_filename"]}"
  }
}

# # create new key pair in local workspace
resource "local_file" "create_new_key_pair" {
  filename = var.aws_key_pair["key_filename"]
  content  = tls_private_key.rsa.private_key_pem
  depends_on = [
    aws_key_pair.ec2-example-key
  ]
  provisioner "local-exec" {
    command = "chmod 400 ${var.aws_key_pair["key_filename"]}"
  }
}

# resource for ec2 instance
resource "aws_instance" "ec2-example" {
  ami           = var.instance_data["ami"]
  instance_type = var.instance_data["instance_type"]
  tags = {
    Name = var.instance_data["tag_name"]
  }
}
