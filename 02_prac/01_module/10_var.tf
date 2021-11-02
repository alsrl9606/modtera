variable "name" {
  type = string
  default = "cmk"
}

variable "region" {
  type = string
  default = "ap-northeast-2"
}

variable "vpc" {
  type = string
  default = "ap-northeast-2"
}
variable "key" {
  type = string
  default = "cmk-key"
}

variable "cidr_main" {
  type = string
  default = "10.0.0.0/16"
}

variable "public_s" {
  type = list
  default = ["10.0.0.0/24", "10.0.2.0/24"] 
}

variable "private_s" {
  type = list
  default = ["10.0.1.0/24", "10.0.3.0/24"] 
}

variable "private_dbs" {
  type = list
  default = ["10.0.4.0/24","10.0.5.0/24"]
}

variable "private_ip" {
  type = string
  default = "10.0.0.11"
}

variable "avazone" {
  type = list
  default = ["a","c"]
}

variable "cidr" {
  type = string
  default = "0.0.0.0/0"
}

variable "ssh_port" {
  type = number
  default = 22
}


variable "http_port" {
  type = number
  default = 80
}

variable "icmp_port" {
  type = number
  default = -1
}

variable "mysql_port" {
  type = number
  default = 3306
}

variable "prot_ssh" {
  type = string
  default = "ssh"
}

variable "prot_tcp" {
  type = string
  default = "tcp"
}

variable "prot_http" {
  type = string
  default = "http"
}

variable "prot-lbtg" {
  type = string
  default = "HTTP"
}

variable "prot_icmp" {
  type = string
  default = "icmp"
}

variable "prot_mysql"{
  type = string
  default = "mysql"
}

variable "ipv6" {
  type = string
  default = "::/0"
}

variable "instance" {
  type = string
  default = "t2.micro"
}

variable "ami" {
  type = string
  default = "ami-0e4a9ad2eb120e054"
}

variable "lb_type" {
  type = string
  default = "application"
}

variable "db" {
  type = string
  default = "mydb"
}