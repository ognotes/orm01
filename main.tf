provider "oci" {
  region = var.region
}

resource "oci_core_virtual_network" "vcn01" {
  cidr_block     = var.vcn01_cidr
  dns_label      = var.vcn01_name
  compartment_id = var.compartment_ocid
  display_name   = var.vcn01_name
}

resource "oci_core_subnet" "subnet01" {
  cidr_block     = var.subnet01_cidr_block
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_virtual_network.vcn01.id
  display_name   = var.subnet01_name
}

resource "oci_core_default_route_table" "defaul_RT_vcn01" {
  manage_default_resource_id = oci_core_virtual_network.vcn01.default_route_table_id

}

resource "oci_core_default_security_list" "defaul_SL_vcn01" {
  manage_default_resource_id = oci_core_virtual_network.vcn01.default_security_list_id

  ingress_security_rules {
    protocol    = 6
    source      = "0.0.0.0/0"
    source_type = "CIDR_BLOCK"
    stateless   = false
    tcp_options {
      max = 22
      min = 22
    }
  }
}
