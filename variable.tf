#vpc variables
variable "vpc_cidr_block" {
    description = "cidr_block"
    type = string
}

variable "instance_tenancy" {
    description = "default_instance_tenancy"
    type = string
}

variable "anusha_vpc" {
    description = "this is vpc name"
    type = string
}

# public subnet variables
variable "public_subnet_cidr_block" {
    description = "cidr_block of public subnet"
    type = string
}

variable "anusha_public_subnet" {
    description = "name of anusha_public_subnet"
    type = string
}

# private subnet variables
variable "private_subnet_cidr_block" {
    description = "cidr_block of private subnet"
    type = string
}

variable "anusha_private_subnet" {
    description = "name of anusha_private_subnet"
    type = string
}

#internet gateway variables
variable "internet_gateway" {
    description = "name of internet_gateway"
    type = string
}

#public route table variables
variable "public_route_table_cidr_block" {
    description = "cidr block for public toute table"
    type = string
}

variable "anusha_public_rt" {
    description = "name of public route table"
    type = string
}

#private route table variables
variable "private_route_table_cidr_block" {
    description = "cidr_block for public toute table"
    type = string
}
variable "anusha_private_rt" {
    description = "name of public route table"
    type = string
}

#nat gateway elastic ip variable
variable "anu-nat-eip" {
    description = "natgate_way_elastic ip name"
    type = string
    }

#nat gatw_way name
variable "anusha_NAT" {
    description = "natgate_way name"
    type = string
    }

#key pair variable
variable "anusha_key_name" {
    description = "key-pair name"
    type = string
    }

    variable "public_key" {
    description = "public-key-pair name"
    type = string
    }

  #security group variables
  variable "anusha_sg" {
    description = "security group name"
    type = string
    }
/*
 variable "ingress_rules" {
  description = "List of ingress rules"
  type = list(object({
    from_port        = number
    to_port          = number
    protocol         = string
    cidr_blocks      = list(string)
    ipv6_cidr_blocks = list(string)
  }))
} 

variable "egress_rules" {
  description = "List of egress rules"
  type = list(object({
    from_port        = number
    to_port          = number
    protocol         = string
    cidr_blocks      = list(string)
    ipv6_cidr_blocks = list(string)
  }))
} 
*/

#public ec2 instance_tenancy
variable "ami_public"{
    description = "ami-id"
    type = string
    }

    variable "instance_type_public_ec2" {
    description = "instance_type id for public ec2"
    type = string
    }

    variable "anusha_key_public_ec2" {
    description = "key-pair name for public ec2"
    type = string
    }

    variable "associate_public_ip_address" {
    description = "associate public ip address"
    type = bool
    }
    

    variable "anusha_public_ec2_tag_name" {
    description = "tag name for public ec2"
    type = string
    }
    

#private ec2 instance_tenancy
variable "ami_private" {
    description = "ami-id"
    type = string
    }

    variable "instance_type_private_ec2" {
    description = "instance_type id for private ec2"
    type = string
    }

    variable "anusha_key_private_ec2" {
    description = "key-pair name for private ec2"
    type = string
    }
    variable "associate_private_ip_address" {
    description = "associate private ip address"
    type = bool
    }

    variable "anusha_private_ec2_name" {
    description = "tag name for private ec2"
    type = string
    }
    


