module "production" {
  source      =  "../01_module"

  region      = "ap-northeast-2"
  cidr        =  "0.0.0.0/0"
  cidr_main   = "10.0.0.0/16"
  name        = "cmk"
  avazone     = ["a","c"]
  key         = "cmk-key"
  public_s    = ["10.0.0.0/24","10.0.2.0/24"]
  private_s   = ["10.0.1.0/24","10.0.3.0/24"]
  private_dbs = ["10.0.4.0/24","10.0.5.0/24"]
  private_ip  = "10.0.0.11"
  http_port           = 80
  ssh_port            = 22
  mysql_port          = 3306
  icmp_port           = -1
  instance            = "t2.micro"
  lb_type             = "application"
  vpc                 = "ap-northeast-2"
  prot_icmp           = "ICMP"
  prot_tcp            = "TCP"
  prot_ssh            = "SSH" 
  prot-lbtg           = "HTTP"
  prot_mysql          = "MYSQL"
  db                  = "mydb"
  ami                 = "ami-0e4a9ad2eb120e054"
  ipv6                = "::/0"
  prot_http           = "HTTP"
}   