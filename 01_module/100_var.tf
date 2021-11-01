variable "name" {
  type = string
  default = "cmk"
}

variable "region" {
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

variable "avazone" {
  type = list
  default = ["a","c"]
}

variable "cidr" {
  type = string
  default = "0.0.0.0/0"
}
