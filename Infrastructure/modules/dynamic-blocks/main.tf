provider "aws"{
    profile = "Sino"
    region = "eu-west-1"
}

data "aws_vpc" "my_vpc"{
    id = "vpc-f8932281"
}

locals {
  ingress = [{
    port = 443
    description = "port 443"
    protocol = "tcp"
  },
  {
    port = 80
    description = "port 80"
    protocol = "tcp"

  }]
}


resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow  inbound traffic"
  vpc_id      = data.aws_vpc.my_vpc.id

  dynamic "ingress"{
      for_each = local.ingress
      content {
        description      = ingress.value.description
        from_port        = ingress.value.port
        to_port          = ingress.value.port
        protocol         = ingress.value.protocol
        cidr_blocks      = [data.aws_vpc.my_vpc.cidr_block]
        ipv6_cidr_blocks = []
        prefix_list_ids = []
        security_groups = []
        self = false
    }
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = []
    prefix_list_ids = []
    security_groups = []
    self = false
  }
}
