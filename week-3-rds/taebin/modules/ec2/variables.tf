variable "config" {
  type = object({
    name = optional(string,"")
    subnet_id = string
    ami = string
    instance_type = optional(string,"t2.micro")
    root_volume_size = optional(number,20)
    security_groups = optional(list(string),[])
    user_data = optional(string,"")
    role_name = optional(string,"")
    policy_arns = optional(list(string),[])
    associate_public_ip_address = optional(bool,false)
    create_instance_profile = optional(bool,true)
    profile_name = optional(string,"")
    create_iam_role = optional(bool,true)
    attach_ssm_role = optional(bool,true)
  })
}
