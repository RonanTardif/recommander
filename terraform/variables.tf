# terraform/variables.tf

variable "project_id" {
  description = "Google Cloud Project ID"
  type        = string
}


variable "region" {
  description = "Google Cloud Region"
  type        = string
  default     = "europe-west9"  # Région de Paris
}
