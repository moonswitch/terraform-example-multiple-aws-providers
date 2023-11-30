variable "base_domain" {
  type        = string
  description = "Base domain from which the subdomain will be delegated (e.g. prd.example.com). This hosted zone must be created outside of this submodule"
}

variable "subdomain" {
  type        = string
  description = "Subdomain that will be delegated from the parent (e.g. use2 to create use2.prd.example.com)"
}