resource "aws_vpc" "main" {
  cidr_block       = var.vpc_cidr_block
  instance_tenancy = "default"

  tags = {
    Name = var.anusha_vpc
  }
}
#creating a public subnet
resource "aws_subnet" "main_public" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.public_subnet_cidr_block

  tags = {
    Name = var.anusha_public_subnet
  }
}
#creating a private subnet
resource "aws_subnet" "main_private" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.private_subnet_cidr_block

  tags = {
    Name = var.anusha_private_subnet
  }
}
#creating an internet gateway
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = var.internet_gateway
  }
}
#creating public route table
resource "aws_route_table" "public_route" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = var.public_route_table_cidr_block
    gateway_id = aws_internet_gateway.gw.id
  }


  tags = {
    Name = var.anusha_public_rt
  }
}

#creating private route table
resource "aws_route_table" "private_route" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = var.private_route_table_cidr_block
 gateway_id = aws_nat_gateway.nat_gateway_1.id
  }
  

  tags = {
    Name = var.anusha_private_rt
  }
}
resource  "aws_route_table_association" "public_subnet_association" {
    route_table_id = aws_route_table.public_route.id
    subnet_id = aws_subnet.main_public.id

}
resource "aws_route_table_association" "private_subnet_association" {
    route_table_id = aws_route_table.private_route.id
    subnet_id = aws_subnet.main_private.id
}

#creating a nat gateway elastic ip
resource "aws_eip" "lb" {
  tags = {
  Name = var.anu-nat-eip
}
}

#creating a nat gateway
resource "aws_nat_gateway" "nat_gateway_1" {
  allocation_id = aws_eip.lb.id
  subnet_id     = aws_subnet.main_public.id

  tags = {
    Name = var.anusha_NAT
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  #depends_on = [aws_internet_gateway.example]

}
#creating key-pair
resource "aws_key_pair" "deployer" {
  key_name   = var.anusha_key_name
  public_key = var.public_key

}
#creating security group
resource "aws_security_group" "allow_tls" {
  name        = var.anusha_sg
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.main.id

  tags = {
    Name = var.anusha_sg
  }

ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }


  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

#create a public ec2 instance_tenancy
resource "aws_instance" "web" {
  ami           = var.ami_public
  instance_type = var.instance_type_public_ec2
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  subnet_id = aws_subnet.main_public.id
  key_name = var.anusha_key_public_ec2
  associate_public_ip_address = var.associate_public_ip_address

  tags = {
    Name = var.anusha_public_ec2_tag_name
  }
}

#create a private ec2 instance_tenancy
resource "aws_instance" "web_1" {
  ami           = var.ami_private
  instance_type = var.instance_type_private_ec2
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  subnet_id = aws_subnet.main_private.id
  key_name = var.anusha_key_private_ec2
  associate_public_ip_address = var.associate_private_ip_address

  tags = {
    Name = var.anusha_private_ec2_name
  }
}