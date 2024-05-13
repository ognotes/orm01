variable "compartment_ocid" {}
variable "region" {}

variable "vcn01_name" { default = "vcn01" }
variable "vcn01_cidr" { default = "10.0.0.0/16" }
variable "subnet01_name" { default = "subnet01" }
variable "subnet01_cidr_block" { default = "10.0.0.0/24" }