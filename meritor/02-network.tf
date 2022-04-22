## VPC
resource "aws_vpc" "vnet" {
    cidr_block = var.vnet_cidr
    enable_dns_hostnames = true
    tags = local.tags
}

## Public Subnet
resource "aws_subnet" "zone_a" {
  vpc_id = aws_vpc.vnet.id
  cidr_block = var.publicsubnet_cidr
  map_public_ip_on_launch = true
  availability_zone = "us-east-1a"
  tags = local.tags
}

## Private Subnet
resource "aws_subnet" "zone_b" {
  vpc_id = aws_vpc.vnet.id
  cidr_block = var.privatesubnet_cidr
  map_public_ip_on_launch = true
  availability_zone = "us-east-1b"
  tags = local.tags
}




