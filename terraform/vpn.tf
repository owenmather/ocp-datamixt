data "aws_acm_certificate" "server-cert" { #Uploaded manually using easy-rsa
  domain = "vpn.datamixt.com"
}

data "aws_acm_certificate" "client-cert" {
  domain = "owen.vpn.datamixt.com"
}

resource "aws_security_group" "vpn_aws_security_group" {
  name        = "VPN_SG"
  description = "VPN_SG"
  vpc_id      = aws_vpc.main_vpc.id

  ingress {
    description = "Allow traffic from VPN Client"
    protocol    = "-1"
    self        = true
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description      = "Allow Outbound"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "VPN_SG"
  }
}

resource "aws_ec2_client_vpn_endpoint" "client-vpn-endpoint" {
  description            = "terraform-clientvpn-example"
  server_certificate_arn = data.aws_acm_certificate.server-cert.arn
  client_cidr_block      = "10.1.0.0/22"

  authentication_options {
    type                       = "certificate-authentication"
    root_certificate_chain_arn = data.aws_acm_certificate.client-cert.arn
  }

  client_login_banner_options {
    banner_text = "Owens AWS Account VPN Connected"
    enabled     = true
  }

  connection_log_options {
    enabled = false
  }

  vpc_id             = aws_vpc.main_vpc.id
  security_group_ids = [aws_security_group.vpn_aws_security_group.id]
}

resource "aws_ec2_client_vpn_authorization_rule" "example" {
  client_vpn_endpoint_id = aws_ec2_client_vpn_endpoint.client-vpn-endpoint.id
  target_network_cidr    = aws_subnet.private_subnet.cidr_block
  authorize_all_groups   = true
}

resource "aws_ec2_client_vpn_network_association" "private-assoc" {
  client_vpn_endpoint_id = aws_ec2_client_vpn_endpoint.client-vpn-endpoint.id
  subnet_id              = aws_subnet.private_subnet.id
}


resource "aws_ec2_client_vpn_route" "private-vpn-route" {
  client_vpn_endpoint_id = aws_ec2_client_vpn_endpoint.client-vpn-endpoint.id
  destination_cidr_block = "0.0.0.0/0"
  target_vpc_subnet_id   = aws_ec2_client_vpn_network_association.private-assoc.subnet_id
}