variable "config" {
  type = object({
    identifier = string
    instance_class = string
    engine = string
    engine_version = string
    username = string
    password = string
    db_name = string
    family = string
    allocated_storage = optional(number,20)
    skip_final_snapshot = optional(bool,true)
    publicly_accessible = optional(bool,false)
    vpc_security_group_ids = optional(list(string))
    subnet_ids = optional(list(string))
    parameter_group_name = optional(string)
    parameters = optional(map(string))
  })
}