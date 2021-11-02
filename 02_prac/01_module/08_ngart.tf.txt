resource "aws_route_table" "cmk_ngart_a" {
  vpc_id  =  aws_vpc.cmk_vpc.id
 
  route {
    cidr_block  = "0.0.0.0/0"
    gateway_id  = aws_nat_gateway.cmk_nga_a.id
  }
  tags  = {
    Name  = "cmk-nga-rta"
  }
}

resource "aws_route_table" "cmk_ngart_c" {
  vpc_id  =  aws_vpc.cmk_vpc.id
 
  route {
    cidr_block  = "0.0.0.0/0"
    gateway_id  = aws_nat_gateway.cmk_nga_c.id
  }
  tags  = {
    Name  = "cmk-nga-rtc"
  }
}