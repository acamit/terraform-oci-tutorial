terraform {
    required_providers {
        oci = {
        source  = "oracle/oci"
        version = "7.16.0"
        }
    }
}

provider "oci" {
    region              = var.region
    auth                = "SecurityToken"
    config_file_profile = "amitchawla"
    # Explicitly set these to ensure no fallback to API key auth
    tenancy_ocid        = null
    user_ocid           = null
    fingerprint         = null
    private_key_path    = null

}

resource "oci_core_vcn" "internal" {
    dns_label      = "internal"
    cidr_block     = "172.16.0.0/20"
    compartment_id = var.compartment_id
    display_name   = "DEV Test VCN A"
}

resource "oci_core_subnet" "dev" {
    vcn_id                     = oci_core_vcn.internal.id
    cidr_block                 = "172.16.0.0/24"
    compartment_id              = var.compartment_id
    display_name               = "Dev subnet"
    prohibit_public_ip_on_vnic = true
    dns_label                  = "dev"
}



