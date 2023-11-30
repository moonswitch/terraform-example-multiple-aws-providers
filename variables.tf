variable "tfc_aws_dynamic_credentials" {
  description = "Object containing AWS dynamic credentials configuration. This object is automatically populated by Terraform Cloud"
  type = object({
    default = object({
      shared_config_file = string
    })
    aliases = map(object({
      shared_config_file = string
    }))
  })
}
