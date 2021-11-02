#region
variable "region" {
  type = string
  default = "ap-northeast-1"
}

#name
variable "name" {
  type = string
  default = "cmk"
}

#key
variable "key" {
  type = string
  default = "cmk-key"
}

#cidr_main
variable "cidr_main" {
  type = string
  default = "192.168.0.0/16"
}

#cidr
variable "cidr" {
  type = string
  default = "0.0.0.0/16"
}

variable "avazone" {
  type = list
  default = ["a","c"]
}

variable "public_s" {
  type = list
  default = ["192.168.0.0/24","192.168.2.0/24"] 
}

variable "private_s" {
  type = list
  default = ["192.168.1.0/24","192.168.3.0/24"]
}

variable "private_dbs" {
  type = list
  default = ["192.168.4.0/24","192.168.5.0/24"]
}

variable "private_ip" {
  type = string
  default = "192.168.0.11"
}