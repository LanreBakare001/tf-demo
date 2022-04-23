variable "region" {
  description = "value"
}

variable "vnet_cidr" {
  description = "value"
}

variable "publicsubnet_cidr" {
	  description = "Public Subnet CIDR_Block"
	  default = "10.5.0.0/24"
}

variable "privatesubnet_cidr" {
	  description = "Private Subnet CIDR_Block"
	  default = "10.5.20.0/24"
}