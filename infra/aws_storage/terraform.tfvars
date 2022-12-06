static_contents_bucket        = "s3-k8s-board-static-contents"
static_contents_acl           = "public-read"
static_contents_website_index = "index.html"
static_contents_website_routing_rules = [{
  condition = {
    http_error_code_returned_equals = 404
  },
  redirect = {
    replace_key_with = "errors/404-error.html"
  }
}]