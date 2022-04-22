# ## Internet Gateway
resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.vnet.id
	tags = local.tags
}



# ## Nat Gateway
# resource "aws_nat_gateway" "public" {
#   allocation_id = aws_eip.public.id
#   subnet_id = aws_subnet.public.id
#   depends_on = [aws_eip.public]
# 	tags = local.tags
# }