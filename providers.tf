terraform {
  cloud {
    organization = "SuperCoolOrg"

    workspaces {
      name = "awesome-workspace"
    }
  }
}

// The default provider is used for "global" resources (e.g. top level domains)
provider "aws" {
  region = "us-east-1"

  shared_config_files = [var.tfc_aws_dynamic_credentials.default.shared_config_file]

  default_tags {
    tags = {
      Terraform          = "provisioned",
      TerraformWorkspace = terraform.workspace
    }
  }
}

provider "aws" {
  alias  = "dns-use2"
  region = "us-east-2"

  shared_config_files = [var.tfc_aws_dynamic_credentials.default.shared_config_file]

  default_tags {
    tags = {
      Terraform          = "provisioned",
      TerraformWorkspace = terraform.workspace
    }
  }
}

provider "aws" {
  alias  = "dns-usw2"
  region = "us-west-2"

  shared_config_files = [var.tfc_aws_dynamic_credentials.default.shared_config_file]

  default_tags {
    tags = {
      Terraform          = "provisioned",
      TerraformWorkspace = terraform.workspace
    }
  }
}

provider "aws" {
  alias  = "prd-gbl"
  region = "us-east-1"

  // The index for the shared config file should match the suffix applied to the TFC_AWS_PROVIDER_AUTH
  // In this case, the variable for the "production" account is TFC_AWS_PROVIDER_AUTH_production
  shared_config_files = [var.tfc_aws_dynamic_credentials.aliases["production"].shared_config_file]

  default_tags {
    tags = {
      Terraform          = "provisioned",
      TerraformWorkspace = terraform.workspace
      Environment        = "prd"
    }
  }
}

provider "aws" {
  alias  = "prd-use2"
  region = "us-east-2"

  shared_config_files = [var.tfc_aws_dynamic_credentials.aliases["production"].shared_config_file]

  default_tags {
    tags = {
      Terraform          = "provisioned",
      TerraformWorkspace = terraform.workspace
      Environment        = "prd"
    }
  }
}

provider "aws" {
  alias  = "prd-usw2"
  region = "us-west-2"

  shared_config_files = [var.tfc_aws_dynamic_credentials.aliases["production"].shared_config_file]

  default_tags {
    tags = {
      Terraform          = "provisioned",
      TerraformWorkspace = terraform.workspace
      Environment        = "prd"
    }
  }
}

provider "aws" {
  alias  = "stg-gbl"
  region = "us-east-1"

  shared_config_files = [var.tfc_aws_dynamic_credentials.aliases["staging"].shared_config_file]

  default_tags {
    tags = {
      Terraform          = "provisioned",
      TerraformWorkspace = terraform.workspace
      Environment        = "stg"
    }
  }
}

provider "aws" {
  alias  = "stg-use2"
  region = "us-east-2"

  shared_config_files = [var.tfc_aws_dynamic_credentials.aliases["staging"].shared_config_file]

  default_tags {
    tags = {
      Terraform          = "provisioned",
      TerraformWorkspace = terraform.workspace
      Environment        = "stg"
    }
  }
}

provider "aws" {
  alias  = "stg-usw2"
  region = "us-west-2"

  shared_config_files = [var.tfc_aws_dynamic_credentials.aliases["staging"].shared_config_file]

  default_tags {
    tags = {
      Terraform          = "provisioned",
      TerraformWorkspace = terraform.workspace
      Environment        = "stg"
    }
  }
}

