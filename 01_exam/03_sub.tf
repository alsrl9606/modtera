#가용영역 a의 public subnet
resource "aws_subnet" "cmk_puba" {
    vpc_id = aws_vpc.cmk_vpc.id
    cidr_block = "10.0.0.0/24"
    availability_zone = "ap-northeast-2a"

    tags = {
      "Name" = "cmk-puba"
    }
  
}

#가용영역 a의 private subnet
resource "aws_subnet" "cmk_pria" {
    vpc_id = aws_vpc.cmk_vpc.id
    cidr_block = "10.0.1.0/24"
    availability_zone = "ap-northeast-2a"

    tags = {
      "Name" = "cmk-pria"
    }
  
}

#가용영역 c의 public subnet
resource "aws_subnet" "cmk_pubc" {
    vpc_id = aws_vpc.cmk_vpc.id
    cidr_block = "10.0.2.0/24"
    availability_zone = "ap-northeast-2c"

    tags = {
      "Name" = "cmk-pubc"
    }
  
}

#가용영역 c의 private subnet
resource "aws_subnet" "cmk_pric" {
    vpc_id = aws_vpc.cmk_vpc.id
    cidr_block = "10.0.3.0/24"
    availability_zone = "ap-northeast-2c"

    tags = {
      "Name" = "cmk-pric"
    }
  
}

resource "aws_subnet" "cmk_pridba" {
  vpc_id            = aws_vpc.cmk_vpc.id
  cidr_block        = "10.0.4.0/24"
  availability_zone = "ap-northeast-2a"

  tags = {
    Name = "sdkim-pridba"
  }
}
resource "aws_subnet" "cmk_pridbc" {
  vpc_id            = aws_vpc.cmk_vpc.id
  cidr_block        = "10.0.5.0/24"
  availability_zone = "ap-northeast-2c"

  tags = {
    Name = "sdkim-pridbc"
  }
}