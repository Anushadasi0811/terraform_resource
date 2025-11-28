resource "aws_vpc" "main" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "sidhu_vpc"
  }
}
#creating a public subnet
resource "aws_subnet" "main_public" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "anusha_public"
  }
}
#creating a private subnet
resource "aws_subnet" "main_private" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "anusha_private"
  }
}
#creating an internet gateway
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "internet_gateway"
  }
}
#creating public route table
resource "aws_route_table" "public_route" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }


  tags = {
    Name = "anusha_public_rt"
  }
}

#creating private route table
resource "aws_route_table" "private_route" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
 gateway_id = aws_nat_gateway.nat_gateway_1.id
  }
  

  tags = {
    Name = "anusha_private_rt"
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
  Name ="anu-nat-eip"
}
}

#creating a nat gateway
resource "aws_nat_gateway" "nat_gateway_1" {
  allocation_id = aws_eip.lb.id
  subnet_id     = aws_subnet.main_public.id

  tags = {
    Name = "anusha_NAT"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  #depends_on = [aws_internet_gateway.example]

}
#creating key-private_route
resource "aws_key_pair" "deployer" {
  key_name   = "anusha_key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQNEl36NdCTVcrekd9AnFPdhbaQUxQa5BUIg6V4VEENXYwoWmk/GBfgsn5Z+d6C7uVqbqyfQ/blN4uil/AOgfLr2pPBd2rwrL/qLZ03Rb45sLzV0bHfce14TIxjXI4gI/R8VsUc1paQy8pccYP4eXCtMh4IAK3k9BCPCEc8Q6ES8dB8v0C02UJLyMoVITApV1fBqoa0oS/k2X62x5MA9K7osUndHB2LOVNqcfCZOGwRqYIEwv3g+HEwrBf0Sae5QTniBMI5H73Yxnm4WiLRAI4X/bFMZww/mNydxL9IXbJ2IQSy2t5TGb9TRI1sgXoIybsllubiUyTEB24R8pmmOobEkNFV8rs9ioZkXId1IZdJWYkPOc90U4CNoORJS8Dao3Bs4d5CITjJ5ThbP9bV63iQZLVr+2d5OiHns7Ok7Tb928yItEwW8WsJtvriZR79KuaAD1zB9PogVsSh+HwHqpNKvZaRHqf9i+ThN9t9uOhWbMETvaIkQM1vj27h7x9GkNZAIWLXvi2WCfuR4a9AEJQHEBhwwlEMKYiuanev8xIYr+zQkE5yBO/4e2AkaY354Qb9ubTDrfAr8cXRXF0W48PYOI2ssy7WKSY09e2ZIbpo4hntlAoTrt0lEDZ3bQVGvNphxJ2HDxkZXJYVHf5tORE1d1+ZGkFH9IjgB4+yeQvHlqw== 91955@Anu"

}
#creating security group
resource "aws_security_group" "allow_tls" {
  name        = "anusha_sg"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.main.id

  tags = {
    Name = "anusha_sg"
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
  ami           = "ami-0ecb62995f68bb549"
  instance_type = "c7i-flex.large"
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  subnet_id = aws_subnet.main_public.id
  key_name = "anusha_key"
  associate_public_ip_address = true

  tags = {
    Name = "anusha_public_ec2"
  }
}

#create a private ec2 instance_tenancy
resource "aws_instance" "web_1" {
  ami           = "ami-0ecb62995f68bb549"
  instance_type = "c7i-flex.large"
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  subnet_id = aws_subnet.main_private.id
  key_name = "anusha_key"
  associate_public_ip_address = false

  tags = {
    Name = "anusha_private_ec2"
  }
}