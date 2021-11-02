resource "aws_route_table_association" "cmk_rtas_a" {
  subnet_id = aws_subnet.cmk_puba.id
  route_table_id = aws_route_table.cmk_rt.id
}

resource "aws_route_table_association" "cmk_rtas_c" {
  subnet_id = aws_subnet.cmk_pubc.id
  route_table_id = aws_route_table.cmk_rt.id
}