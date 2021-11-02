resource "aws_route_table" "cmk_rt" {
  vpc_id = aws_vpc.cmk_vpc.id
  
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.cmk_ig.id
    }
    tags = {
        Name = "cmk-rt"
    }
}