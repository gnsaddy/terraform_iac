# used to store the variables 

# variable for aws key pair
variable "aws_key_pair" {
  type        = map(string)
  description = "variable for aws key pair"
  default = {
    algorithm_name = "RSA"
    rsa_bits       = "4096"
    key_name       = "ec2-example-key"
    key_filename   = "ec2-example-key.pem"
  }
}

# variable for instance data
variable "instance_data" {
  type        = map(string)
  description = "variable for instance name, instance type, ami and tag name"
  default = {
    instance_name = "ec2-example"
    instance_type = "t2.micro"
    ami           = "ami-097a2df4ac947655f"
    tag_name      = "ec2-example-tag"
  }
}

