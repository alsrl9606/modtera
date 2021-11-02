resource "aws_security_group" "cmk_websg" {
  name        = "Allow-WEB"
  description = "http-ssh-icmp"
  vpc_id      = aws_vpc.cmk_vpc.id

  ingress = [
    {
      description       = var.prot_ssh
      from_port         = var.ssh_port
      to_port           = var.ssh_port
      protocol          = var.prot_tcp
      cidr_blocks       = [var.cidr]
      ipv6_cidr_blocks  = [var.ipv6]
      security_groups   =  null
      prefix_list_ids   =  null
      self              =  null
    },
    {
      description     = var.prot_http
      from_port       = var.http_port
      to_port         = var.http_port
      protocol        = var.prot_tcp
      cidr_blocks      = [var.cidr]
      ipv6_cidr_blocks  = [var.ipv6]
      security_groups  =  null
      prefix_list_ids  =  null
      self             =  null
    },
    {
      description     = var.prot_icmp
      from_port       = var.icmp_port
      to_port         = var.icmp_port
      protocol        = var.prot_icmp
      cidr_blocks      = [var.cidr]
      ipv6_cidr_blocks  = [var.ipv6]
      security_groups  =  null
      prefix_list_ids  =  null
      self             =  null
    },
    {
      description     = var.prot_mysql
      from_port       = var.mysql_port
      to_port         = var.mysql_port
      protocol        = var.prot_tcp
      cidr_blocks      = [var.cidr]
      ipv6_cidr_blocks  = [var.ipv6]
      security_groups  =  null
      prefix_list_ids  =  null
      self             =  null
    }
  ]

   egress = [
     {
      description     = "All"
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = [var.cidr]
      ipv6_cidr_blocks = [var.ipv6]
      security_groups  =  null
      prefix_list_ids  =  null
      self             =  null
    }
   ]
  tags = {
    Name = "cmk-sg"
  }
} 


resource "aws_instance" "cmk_web" {
  ami                    = var.ami                          #data.aws_ami.amzn.id
  instance_type          = var.instance
  key_name               = var.key
  vpc_security_group_ids = [aws_security_group.cmk_websg.id]
  availability_zone      = "${var.region}${var.avazone[0]}"
  private_ip             = var.private_ip
  subnet_id              = aws_subnet.cmk_pub[0].id
  user_data              = file("./install_seoul.sh") 

  tags = {
    Name = "${var.name}-web"
  }
}
resource "aws_eip" "cmk_web_eip" {
  vpc = true
  instance                    = aws_instance.cmk_web.id
  associate_with_private_ip   = var.private_ip
  depends_on                  = [aws_internet_gateway.cmk_ig]
}