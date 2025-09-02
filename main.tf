terraform {
  required_providers {
    oci = {
      source  = "oracle/oci"
      version = "7.16.0"
    }
  }
}

provider "oci" {
  region              = "us-ashburn-1"
  auth                = "SecurityToken"
  config_file_profile = "learn-terraform"
}

resource "oci_core_vcn" "internal" {
  dns_label      = "internal"
  cidr_block     = "172.16.0.0/20"
  compartment_id = "ocid1.compartment.oc1..aaaaaaaarb7lridphahoxckg4fywfu5vfmxru4d4lnsgxwalkzbiff6qwlsa"
  display_name   = "DEV Test VCN A"
}
