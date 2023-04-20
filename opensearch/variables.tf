# Following varibales are for module zone and acm_request_certificate
variable "process_domain_validation_options" {
  type        = bool
  description = "Flag to enable/disable processing of the record to add to the DNS zone to complete certificate validation"
  default     = true
}

variable "ttl" {
  type        = number
  description = "The TTL of the record to add to the DNS zone to complete certificate validation"
  default     = 300
}

variable "wait_for_certificate_issued" {
  type        = bool
  description = "Whether to wait for the certificate to be issued by ACM (the certificate status changed from `Pending Validation` to `Issued`)"
  default     = true
}

# Following variables are for opensearch
variable "name" {
  type        = string
  description = "Name of the Cluster"
}

variable "domain" {
  type        = string
  description = "Name of the Domain"
}

variable "custom_endpoint_enabled" {
  type        = bool
  description = "Enable custome endpoint"
  default     = true
}

variable "custom_endpoint" {
  type        = string
  description = "The name of the Custom hostname"
}

variable "elasticsearch_version" {
  type        = string
  description = "Version of Elasticsearch to deploy"
}

variable "instance_type" {
  type        = string
  description = "The type of the instance"
}

variable "availability_zone_count" {
  type        = number
  description = "Number of availability zone in the cluster"
}

variable "instance_count" {
  type        = number
  description = "Number of data nodes in the cluster"
}

variable "ebs_volume_size" {
  type        = number
  description = "EBS volumes for data storage in GB"
}

variable "dedicated_master_enabled" {
  type        = bool
  description = "Indicates whether dedicated master nodes are enabled for the cluster"
  default     = false
}

variable "encrypt_at_rest_enabled" {
  type        = bool
  description = "Whether to enable encryption at rest"
  default     = true
}

#Advance security options
variable "advanced_security_options_internal_user_database_enabled" {
  type        = bool
  description = "Enable internal database for master user"
  default     = true
}

variable "advanced_security_options_master_user_name" {
  type        = string
  description = "Master username for Kibana"
}

variable "advanced_security_options_master_user_password" {
  type        = string
  description = "master username password"
  sensitive   = true
}
