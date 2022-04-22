resource "aws_key_pair" "deployer" {
  key_name   = "id_rsa"
  public_key = file("~/.ssh/id_ed25519.pub")
}

data "aws_ami" "ubuntu" {
  most_recent = "true"

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }


  owners = ["099720109477"]
}

resource "aws_instance" "default" {
  ami                                  = data.aws_ami.ubuntu.id
  ebs_optimized                        = true
  instance_type                        = "t3.micro"
  key_name                             = aws_key_pair.deployer.key_name
  monitoring                           = true
  vpc_security_group_ids               = [aws_security_group.allow_tls.id]
  subnet_id                            = aws_subnet.zone_a.id
  # private_ip                           = dynamic
  associate_public_ip_address          = true
  iam_instance_profile                 = aws_iam_instance_profile.default.name

  # root_block_device {
  #   delete_on_termination = true
  #   encrypted             = true
  #   kms_key_id            = aws_kms_key.instance_stg_key.key_id
  #   tags = local.tags
  # }

  # network_interface {
  #   network_interface_id = aws_network_interface.instance_nic.id
  #   device_index         = 0
  # }

  credit_specification {
    cpu_credits = "unlimited"
  }

  tags = local.tags

  lifecycle {
    ignore_changes = [
      private_ip
    ]
  }
}

## Elastic IP
resource "aws_eip" "public" {
	vpc = true
	tags = local.tags
}

# NIC
resource "aws_network_interface" "instance_nic" {
  subnet_id   = aws_subnet.zone_a.id
  security_groups = ["${aws_security_group.allow_tls.id}"]
  tags = local.tags
}