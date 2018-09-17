variable "region" {
  description = "AWS region in which to deploy the S3 bucket (and Lambdas if requested). Note that CloudFront Distribution & IAM roles/policies are globally provisioned. Certificates for CloudFront distributions can only be created in us-east-1, as such the certificate will be created there if required"
}
variable "env" {
  description = "Deployment environment of application, will be included in resource names, and tags. e.g. 'dev'"
}
variable "domain_name" {
  description = "Primary domain for this distribution. Be aware that A & AAAA records will be created in Route53 for this with target of your CloudFront distribution. If not provided, the default CloudFront domain will be used."
  default = ""
}
variable "additional_domains" {
  description = "Additional domains for this distribution. Be ware that A & AAAA records will be created in Route53 for this with a target of your CloudFront distrubution. If not provided, no additional domains will be added."
  type = "list"
  default = []
}

variable "route53_zone_name" {
  description = "The name of your Route 53 zone in which to create the records e.g. example.com. If absent, no records will be created."
  default = ""
}

variable "provision_lambdas" {
  description = "Whether to provision the custom event Lambdas, or use a basic CloudFront distribution - valid values 'true' or 'false'"
  default = "true"
}