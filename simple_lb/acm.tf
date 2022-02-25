## Common
resource "aws_acm_certificate" "inamuu-com" {
  domain_name               = "inamuu.com"
  subject_alternative_names = ["*.inamuu.com"]
  validation_method         = "DNS"

  tags {
    Environment = "staging"
  }

  lifecycle {
    create_before_destroy = true
  }
}

## For CloudFront
provider "aws" {
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  alias      = "us-east"
  region     = "us-east-1"
}

resource "aws_acm_certificate" "inamuu-com-cloudfront" {
  provider                  = "aws.us-east"
  domain_name               = "inamuu.com"
  subject_alternative_names = ["*.inamuu.com"]
  validation_method         = "DNS"

  tags {
    Environment = "staging"
  }

  lifecycle {
    create_before_destroy = true
  }
}
