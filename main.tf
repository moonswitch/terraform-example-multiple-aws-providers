resource "aws_route53_zone" "example_com" {
  name = "example.com"
}

module "prd_example_com" {
  source = "./env_domains"

  providers = {
    aws.dns-gbl  = aws
    aws.env-gbl  = aws.prd-gbl
    aws.env-use2 = aws.prd-use2
    aws.env-usw2 = aws.prd-usw2
  }

  base_domain = aws_route53_zone.example_com.name
  environment = "production"

  depends_on = [aws_route53_zone.example_com]
}

module "stg_example_com" {
  source = "./env_domains"

  providers = {
    aws.dns-gbl  = aws
    aws.env-gbl  = aws.stg-gbl
    aws.env-use2 = aws.stg-use2
    aws.env-usw2 = aws.stg-usw2
  }

  base_domain = aws_route53_zone.example_com.name
  environment = "staging"

  depends_on = [aws_route53_zone.example_com]
}
