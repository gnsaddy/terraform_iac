# used to store the variables 

# variable for aws region
variable "aws_region" {
  type        = string
  description = "variable for aws region"
  default     = "us-east-2"
}

# variable for aws vpc
variable "vpc_data" {
  type        = map(string)
  description = "variable for vpc cidr block and tag name"
  default = {
    cidr_block = "10.0.0.0/16"
    tag_name   = "vpc-example-tag"
  }
}

# variable for aws public subnet cidr blocks
variable "public_subnet_cidrs" {
  type        = list(string)
  description = "value for public subnet cidr blocks"
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

# variable for aws private subnet cidr blocks
variable "private_subnet_cidrs" {
  type        = list(string)
  description = "value for private subnet cidr blocks"
  default     = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
}

# variable for aws availability zone
variable "availability_zone" {
  type        = list(string)
  description = "value for aws availability zone"
  default     = ["us-east-2a", "us-east-2b", "us-east-2c"]
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


# variable for internet gateway
variable "internet_gateway_data" {
  type        = map(string)
  description = "variable for internet gateway tag name"
  default = {
    tag_name = "internet-gateway-example-tag"
  }
}

# variable for aws route table
variable "route_table_data" {
  type        = map(string)
  description = "variable for route table tag name"
  default = {
    tag_name = "route-table-example-tag"
  }
}
