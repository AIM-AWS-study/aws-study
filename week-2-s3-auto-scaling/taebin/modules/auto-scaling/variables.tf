variable "config" {
  type = object({
    name = string
    image_id = string
    instance_type = optional(string, "t3.micro")
    user_data = optional(string, "")
    security_groups = optional(list(string), [])
    iam_instance_profile = optional(string, null)
    associate_public_ip_address = optional(bool, false)
    min_size = optional(number, 2)
    max_size = optional(number, 5)
    vpc_zone_identifier = optional(list(string), [])
    health_check_type = optional(string)
    create_iam_role = optional(bool, true)
    role_name = optional(string, "")
    policy_arns = optional(list(string), [])
    create_instance_profile = optional(bool, true)
    target_group_arns = optional(list(string))
  })
}