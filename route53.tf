data "aws_route53_zone" "this" {
  name         = "twotierprojectgiri.com"
  private_zone = false
}

resource "aws_route53_record" "alb_record" {
  zone_id = data.aws_route53_zone.this.zone_id
  name    = "twotierprojectgiri.com"   # root domain
  type    = "A"

  alias {
    name                   = aws_lb.alb.dns_name
    zone_id                = aws_lb.alb.zone_id
    evaluate_target_health = true
  }
}
