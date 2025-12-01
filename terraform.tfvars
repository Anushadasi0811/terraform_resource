#vpc variable values
vpc_cidr_block = "10.0.0.0/16"
instance_tenancy = "default"
anusha_vpc = "ansuha-vpc"

#public subnet variable values
public_subnet_cidr_block = "10.0.1.0/24"
anusha_public_subnet = "anusha-public-subnet"

#private subnet variable values
private_subnet_cidr_block = "10.0.2.0/24"
anusha_private_subnet = "anusha-private-subnet"

#internet_gateway variables values
internet_gateway = "internet_gateway"

#public route table variable values
public_route_table_cidr_block = "0.0.0.0/0"
anusha_public_rt = "anusha-public-rt"

#private route table variable values
private_route_table_cidr_block = "0.0.0.0/0"
anusha_private_rt = "anusha-private-rt"

#nat_gate_way elastic_ip name values
  anu-nat-eip = "anu-nat-eip"

 #nat_gate_way name values
 anusha_NAT = "anusha-NAT"

#key-pair values
  anusha_key_name   = "anusha-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQNEl36NdCTVcrekd9AnFPdhbaQUxQa5BUIg6V4VEENXYwoWmk/GBfgsn5Z+d6C7uVqbqyfQ/blN4uil/AOgfLr2pPBd2rwrL/qLZ03Rb45sLzV0bHfce14TIxjXI4gI/R8VsUc1paQy8pccYP4eXCtMh4IAK3k9BCPCEc8Q6ES8dB8v0C02UJLyMoVITApV1fBqoa0oS/k2X62x5MA9K7osUndHB2LOVNqcfCZOGwRqYIEwv3g+HEwrBf0Sae5QTniBMI5H73Yxnm4WiLRAI4X/bFMZww/mNydxL9IXbJ2IQSy2t5TGb9TRI1sgXoIybsllubiUyTEB24R8pmmOobEkNFV8rs9ioZkXId1IZdJWYkPOc90U4CNoORJS8Dao3Bs4d5CITjJ5ThbP9bV63iQZLVr+2d5OiHns7Ok7Tb928yItEwW8WsJtvriZR79KuaAD1zB9PogVsSh+HwHqpNKvZaRHqf9i+ThN9t9uOhWbMETvaIkQM1vj27h7x9GkNZAIWLXvi2WCfuR4a9AEJQHEBhwwlEMKYiuanev8xIYr+zQkE5yBO/4e2AkaY354Qb9ubTDrfAr8cXRXF0W48PYOI2ssy7WKSY09e2ZIbpo4hntlAoTrt0lEDZ3bQVGvNphxJ2HDxkZXJYVHf5tORE1d1+ZGkFH9IjgB4+yeQvHlqw== 91955@Anu"

#security group variable values
anusha_sg = "anusha-sg"


#public ec2 instance_tenancy variable values
  ami_public           = "ami-0ecb62995f68bb549"
  instance_type_public_ec2 = "c7i-flex.large"
  anusha_key_public_ec2 = "anusha-key"
  associate_public_ip_address = true
  #tag name 
  anusha_public_ec2_tag_name = "anusha-public-ec2"
      

#private ec2 instance_tenancy variable values
ami_private           = "ami-0ecb62995f68bb549"
  instance_type_private_ec2 = "c7i-flex.large"
   anusha_key_private_ec2 = "anusha-key"
  associate_private_ip_address = false
  #tag name
anusha_private_ec2_name = "anusha-private-ec2"







