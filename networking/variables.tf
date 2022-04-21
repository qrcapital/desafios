#importando variaveis
variable "vpc_cidr" {
  type        = string
}

variable "public_subnet_cidr_a" {
  type        = string
}

variable "public_subnet_cidr_b" {
  type        = string
}

variable "private_subnet_cidr_a" {
  type        = string
}

variable "private_subnet_cidr_b" {
  type        = string
}

variable "region" {
  type        = string
}

