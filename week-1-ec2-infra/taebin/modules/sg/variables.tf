variable "config" {
  type = object({
    name   = string
    vpc_id = string
    tags   = optional(map(string))
    ingress_rules = optional(map(object({
      ingress_from_port = number
      ingress_to_port   = number
      ingress_protocol  = string
      self              = optional(bool)
      cidr_blocks       = optional(list(string))
      security_group_id = optional(string)
    })))
    egress_rules = optional(map(object({
      egress_from_port  = number
      egress_to_port    = number
      egress_protocol   = string
      self              = optional(bool)
      cidr_blocks       = optional(list(string))
      security_group_id = optional(string)
    })))
  })
  validation {
    // ingress_rules의 cidr_blocks, self, security_group_id 중 하나만 설정해야 함
    condition     = alltrue([for k, r in var.config.ingress_rules : (r.cidr_blocks != null && length(coalesce(r.cidr_blocks, [])) > 0 && r.self == null && r.security_group_id == null) || (r.cidr_blocks == null && r.self == true && r.security_group_id == null) || (r.cidr_blocks == null && r.self == null && r.security_group_id != null)])
    error_message = "cidr_blocks, self, security_group_id 중 하나 설정해야 함"
  }
  validation {
    // egress_rules의 cidr_blocks, self, security_group_id 중 하나만 설정해야 함
    condition     = alltrue([for k, r in var.config.egress_rules : (r.cidr_blocks != null && length(coalesce(r.cidr_blocks, [])) > 0 && r.self == null && r.security_group_id == null) || (r.cidr_blocks == null && r.self == true && r.security_group_id == null) || (r.cidr_blocks == null && r.self == null && r.security_group_id != null)])
    error_message = "cidr_blocks, self, security_group_id 중 하나 설정해야 함"
  }
}