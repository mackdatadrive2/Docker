resource "aws_network_acl" "aws_nacl" {
    vpc_id = data.aws_vpc.GetVPC.id
    subnet_ids = [data.aws_subnet.GetSubnet.id] 
  #allow ingress traffic on port 22

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    action = "allow"
    cidr_block  = "data.aws_subnet.GetSubnet.cidr_block"
    rule_no = 100
}
 # allow ingress traffic on port 80
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    action = "allow"
    cidr_block  = "data.aws_subnet.GetSubnet.cidr_block"
    rule_no = 110

  }
  # allow egress traffic on port 80
  egress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    action = "allow"
    cidr_block  = "data.aws_subnet.GetSubnet.cidr_block"
    rule_no = 120

  }
    # allow egress traffic on port 22
    egress {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      action = "allow"
      cidr_block  = "data.aws_subnet.GetSubnet.cidr_block"
      rule_no = 130
    }   

    #allow ingress on ephemeral ports
    ingress {
        from_port   = 1024
        to_port     = 65535
        protocol    = "tcp"
        action = "allow"
        cidr_block  = "data.aws_subnet.GetSubnet.cidr_block"
        rule_no = 140
    }

    tags = {
      Name = "Custom_NACL"
    }
}