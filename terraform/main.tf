provider "aws" {
  region = "eu-west-1" # Change the region as necessary
}

# Fetch the latest Amazon Linux 2023 AMI securely by using most_recent with owner filter
data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"] # Owner ID for Amazon

  filter {
    name   = "name"
    values = ["al2023-ami-2023*"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"] # Use arm64 if necessary
  }
}

# Generate an RSA key pair securely
resource "aws_key_pair" "aws_key_pair" {
  key_name   = "ocp"
  public_key = file("~/.ssh/id_rsa.pub")
  # Path to an existing RSA public key

  tags = {
    Name = "ocp"
  }
}

# Secure Security Group for SSH access
resource "aws_security_group" "aws_security_group" {
  name        = "OCP_SG"
  description = "OCP SG"
  vpc_id      = aws_vpc.main_vpc.id

  ingress {
    description = "Allow VPN Traffic"
    protocol    = "-1"
    self        = true
    from_port   = 0
    to_port     = 0
    cidr_blocks = [aws_subnet.private_subnet.cidr_block]
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
    Name = "OCP_SG"
  }
}

# Create a secure EC2 instance with Amazon Linux 2023 AMI
resource "aws_instance" "host" {
  ami                  = data.aws_ami.amazon_linux.id
  instance_type        = "t3.medium" # Change the instance type as necessary
  key_name             = aws_key_pair.aws_key_pair.key_name
  monitoring           = false # Enable detailed monitoring
  subnet_id            = aws_subnet.private_subnet.id
  iam_instance_profile = aws_iam_instance_profile.ssm_instance_profile.name
  vpc_security_group_ids = [aws_security_group.aws_security_group.id]
  root_block_device {
    encrypted   = true # Ensure the root volume is encrypted
    volume_size = 300  # Increase as necessary
  }

  tags = {
    Name = "ocp" # You can change the name as desired
    type = "jump"
  }

  metadata_options {
    http_endpoint = "enabled"
    http_tokens   = "required"
  }

  lifecycle {
    prevent_destroy = false # Prevent the instance from accidental deletion
  }
}
