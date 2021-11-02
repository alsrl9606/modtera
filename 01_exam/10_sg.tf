resource "aws_security_group" "cmk_websg" {
  name = "Allow-WEB"
  description = "http-ssh-icmp"
  vpc_id = aws_vpc.cmk_vpc.id

  ingress = [
  {
      description = "ssh"
      security_groups = null
      prefix_list_ids = null
      self            = null
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks  = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]

    } ,
  {
      description = "http"
      security_groups = null
      prefix_list_ids = null
      self            = null
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks  = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]

    } ,
  {
      description = "icmp"
      security_groups = null
      prefix_list_ids = null
      self            = null
      from_port   = -1
      to_port     = -1
      protocol    = "icmp"
      cidr_blocks  = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]

    },
  {
      description = "mysql"
      security_groups = null
      prefix_list_ids = null
      self            = null
      from_port   = 3306
      to_port     = 3306
      protocol    = "tcp"
      cidr_blocks  = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]

    }
  ]
    egress = [
      {
      description = "All"
      security_groups = null
      prefix_list_ids = null
      self            = null
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks  = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"] 
    }
  ]
  tags = {
    Name = "cmk-sg"
  }
}