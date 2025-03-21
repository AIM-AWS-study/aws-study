variable "config" {
  type = object({
    name = string
    region = optional(string, "ap-northeast-2")
    versioning = optional(bool, false)
    public_access_block= optional(bool,false)
  })
}

