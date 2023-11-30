data "aws_route53_zone" "base" {
  provider = aws.base
  name     = var.base_domain
}

resource "aws_route53_zone" "sub" {
  provider = aws.sub
  name     = "${var.subdomain}.${var.base_domain}"
}

resource "aws_route53_record" "sub-ns" {
  provider = aws.base
  zone_id  = data.aws_route53_zone.base.zone_id
  name     = aws_route53_zone.sub.name
  type     = "NS"
  ttl      = "30"
  records  = aws_route53_zone.sub.name_servers
}