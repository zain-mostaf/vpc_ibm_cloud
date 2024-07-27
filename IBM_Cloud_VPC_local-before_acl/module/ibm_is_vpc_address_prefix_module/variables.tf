variable exists {
    type = bool
    description = "true if using an existent address prefix and false if using a new address prefix"
    default = false
}

variable name {
    type = string
    description = "Name (for new or of existing) VPC address prefix"
}

variable zone {
    type = string
    description = "the zone for a new vpc address prefix"
}

variable vpc_id {
    type = string
    description = "the id of the VPC for a new vpc address prefix"
}

variable cidr {
    type = string
    description = "the cidr for a new vpc address prefix"
}
