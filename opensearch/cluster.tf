resource "aws_route53_zone" "main" {
  name = var.domain

  resource "aws_route53_record" "prod-ns" {
    zone_id = aws_route53_zone.main.zone_id
    name    = aws_route53_zone.main.name
    type    = "NS"
    ttl     = "30"
    records = aws_route53_zone.main.name_servers
  }

  module "acm_request_certificate" {
    source                            = "cloudposse/acm-request-certificate/aws"
    version                           = "~> 0.16.0"
    domain_name                       = aws_route53_zone.main.name
    zone_id                           = aws_route53_zone.main.zone_id
    validation_method                 = "DNS"
    ttl                               = var.ttl
    subject_alternative_names         = ["*.${aws_route53_zone.main.name}"]
    process_domain_validation_options = var.process_domain_validation_options
    wait_for_certificate_issued       = var.wait_for_certificate_issued
  }

  module "opensearch" {
    source                            = "cloudposse/elasticsearch/aws"
    version                           = "~> 0.35.0"
    name                              = var.name
    custom_endpoint_enabled           = var.custom_endpoint_enabled
    custom_endpoint                   = var.custom_endpoint
    dns_zone_id                       = aws_route53_zone.main.zone_id
    custom_endpoint_certificate_arn   = module.acm_request_certificate.arn
    vpc_enabled                       = false
    elasticsearch_version             = var.elasticsearch_version
    availability_zone_count           = var.availability_zone_count
    instance_type                     = var.instance_type
    instance_count                    = var.instance_count
    ebs_volume_size                   = var.ebs_volume_size
    dedicated_master_enabled          = var.dedicated_master_enabled
    encrypt_at_rest_enabled           = var.encrypt_at_rest_enabled
    advanced_security_options_enabled = true
    node_to_node_encryption_enabled   = true

    # Advance security Option - Might be of NO use with SAML, adding now as SAML can ONLY be configured after domain in up 
    advanced_security_options_internal_user_database_enabled = var.advanced_security_options_internal_user_database_enabled
    advanced_security_options_master_user_name               = var.advanced_security_options_master_user_name
    advanced_security_options_master_user_password           = var.advanced_security_options_master_user_password

    advanced_options = {
      "rest.action.multi.allow_explicit_index" = "true"
    }
  }
}
