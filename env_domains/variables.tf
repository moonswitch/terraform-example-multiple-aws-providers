variable "environment" {
  type        = string
  description = "Environment for the domain. One of: production, development, staging, demo"
}

variable "base_domain" {
  type        = string
  description = "Base domain from which the subdomains will be delegated (e.g. example.com). This hosted zone must be created outside of this submodule"
}