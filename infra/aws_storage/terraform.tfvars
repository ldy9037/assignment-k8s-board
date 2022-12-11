static_contents_bucket        = "board.emadam.shop"
static_contents_attach_policy = true
static_contents_website_index = "index.html"
static_contents_website_routing_rules = [{
  condition = {
    http_error_code_returned_equals = 404
  },
  redirect = {
    replace_key_with = "errors/404-error.html"
  }
}]

route53_record_name    = "board"
route53_record_type    = "CNAME"
route53_record_ttl     = 300
route53_record_records = ["d3se4t2d8cthze.cloudfront.net"]

static_contents_acm_create = true
static_contents_acm_wfv    = true