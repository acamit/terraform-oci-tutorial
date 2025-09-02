variable "compartment_id" {
    description = "ocid1.compartment.oc1..aaaaaaaarb7lridphahoxckg4fywfu5vfmxru4d4lnsgxwalkzbiff6qwlsa"
    type        = string
}

variable "region" {
    description = "region where you have OCI tenancy"
    type = string
    default = "us-ashburn-1"
}


variable "sensitive" {
    description = "region where you have OCI tenancy"
    type = string
    default = "us-ashburn-1"
    sensitive = true
}

variable "instances_per_subnet" {
  description = "Number of EC2 instances in each private subnet"
  type        = number
  default     = 2
}
