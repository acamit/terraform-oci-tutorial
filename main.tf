locals {
  name_suffix = "${var.resource_tags["project"]}-${var.resource_tags["environment"]}"
}

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
  config_file_profile = "learn-terraform"
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

resource "aws_instance" "app" {
    depends_on =  [module.vpc]
    count = var.instances_per_subnet * 
}

 module "app_security_group" {
   source  = "terraform-aws-modules/security-group/aws//modules/web"
   version = "3.17.0"

   name        = "web-sg-${local.name_suffix}"
 }



