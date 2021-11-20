provider "aws" {
    region     = "ap-south-1"
 
}

#Create security group with firewall rules
resource "aws_security_group" "my_security_group" {
  vpc_id = "vpc-9ea0aef6"
  name        = "my_security_group"
  description = "security group for Ec2 instance"

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

 ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

 # outbound from jenkis server
  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags= {
    Name = "my_security_group"
  }
}

# Create AWS ec2 instance
resource "aws_instance" "myFirstInstance" {
  ami           = "ami-0108d6a82a783b352"
  key_name = "myos2"
  instance_type = "t2.micro"
  security_groups= ["my_security_group"]
  tags= {
         Environment = "Prod"
         Project     = "Fresher Training"  
  }
}

# Create Elastic IP address
resource "aws_eip" "myFirstInstance" {
  vpc      = true
  instance = aws_instance.myFirstInstance.id
tags= {
    Name = "my_elastic_ip"
  }
}
