resource "aws_eip" "lb_ip_a" {

  #  instance = aws_instance.web.id
  vpc         = true
}

resource "aws_eip" "lb_ip_c" {
  
  #  instance = aws_instance.web.id
  vpc         = true
}

resource "aws_nat_gateway" "cmk_nga-a" {
  allocation_id = aws_eip.lb_ip_a.id
  subnet_id = aws_subnet.cmk_pria.id
  tags = {
    "Name" = "cmk-nga-a"
  }
}

resource "aws_nat_gateway" "cmk_nga-c" {
  allocation_id = aws_eip.lb_ip_c.id
  subnet_id = aws_subnet.cmk_pric.id
  tags = {
    "Name" = "cmk-nga-c"
  }
}