resource "aws_eip" "cmk_lb_ip" {
  count = "${length(var.public_s)}"
  vpc      = true
}

resource "aws_nat_gateway" "cmk_nga" {
  count = "${length(var.public_s)}"
  allocation_id = aws_eip.cmk_lb_ip[count.index].id
  subnet_id     = aws_subnet.cmk_pub[count.index].id

  tags = {
    Name = "cmk-nga${var.avazone[count.index]}"
  }
}

resource "aws_route_table" "cmk_ngart" {
  vpc_id  =  aws_vpc.cmk_vpc.id
  count   =  "${length(var.public_s)}"
 
  route {
    cidr_block  = "0.0.0.0/0"
    gateway_id  = aws_nat_gateway.cmk_nga[count.index].id
  }
  tags  = {
    Name  = "cmk-nga-rta${var.avazone[count.index]}"
  }
}

resource "aws_route_table_association" "cmk_ngartas" {
  count          = "${length(var.public_s)}"
  subnet_id      = aws_subnet.cmk_pri[count.index].id
  route_table_id = aws_route_table.cmk_ngart[count.index].id
}