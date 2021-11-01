resource "aws_internet_gateway" "cmk_ig" {
  vpc_id = aws_vpc.cmk_vpc.id

  tags = {
    Name = "cmk-ig"
  }
}