variable "compartment_id" {
    description = "amit chawla compartment"
    default = "ocid1.compartment.oc1..aaaaaaaayrzsussfqwvajn33m4u74iarsysakmyxcqry37bjggia5mnrhypq"
    type        = string
}

variable "tenancy_ocid" {
    description = "amit chawla tenancy"
    type        = string
    default = "ocid1.tenancy.oc1..aaaaaaaabbfwxfbromglaisyushhkaaknikmqxdkxoz45tcnfjvx4qwzynma"
}


variable "region" {
    description = "region where you have OCI tenancy"
    type = string
    default = "ca-toronto-1"
}

