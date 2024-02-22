resource "aws_wafv2_ip_set" "ipset" {
  name               = "blocked_ips"
  description        = "Example IP set"
  scope              = "REGIONAL"
  ip_address_version = "IPV4"
  addresses          = ["<ADD_YOUR_IP>/32"]
}

module "wafv2" {
  source  = "trussworks/wafv2/aws"
  version = "4.0.0"

  name   = "wafv2"
  scope = "REGIONAL"

  alb_arn        =   aws_lb.myalb.arn
  associate_alb = true

  ip_sets_rule = [
    {
      name       = "blocked_ips"
      action     = "block"
      priority   = 1
      ip_set_arn = aws_wafv2_ip_set.ipset.arn
    }
  ]
}