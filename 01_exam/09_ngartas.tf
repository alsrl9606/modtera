resource "aws_route_table_association" "cmk_ngartas_a" {
  subnet_id = aws_subnet.cmk_pria.id
  route_table_id = aws_route_table.cmk_ngart_a.id

}

resource "aws_route_table_association" "cmk_ngartas_c" {
  subnet_id = aws_subnet.cmk_pric.id
  route_table_id = aws_route_table.cmk_ngart_c.id

}