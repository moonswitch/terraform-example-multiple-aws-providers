locals {
  env_to_short = {
    "demo"        = "dmo"
    "development" = "dev"
    "production"  = "prd"
    "staging"     = "stg"
    "test"        = "tst"
  }
  env_short_code = local.env_to_short[var.environment]
}

module "gbl_env_domain" {
  source = "../delegated_zone"

  providers = {
    aws.base = aws.dns-gbl
    aws.sub  = aws.env-gbl
  }

  base_domain = var.base_domain
  subdomain   = local.env_short_code
}

module "use2_env_domain" {
  source = "../delegated_zone"

  providers = {
    aws.base = aws.env-gbl
    aws.sub  = aws.env-use2
  }

  base_domain = module.gbl_env_domain.hosted_zone.name
  subdomain   = "use2"
}

module "usw2_env_domain" {
  source = "../delegated_zone"

  providers = {
    aws.base = aws.env-gbl
    aws.sub  = aws.env-usw2
  }

  base_domain = module.gbl_env_domain.hosted_zone.name
  subdomain   = "usw2"
}