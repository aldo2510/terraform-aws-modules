variable "bucket_name" {
  description = "Globally unique S3 bucket name. Must follow AWS naming rules."
  type        = string
  nullable    = false
  validation {
    condition     = length(var.bucket_name) >= 3 && length(var.bucket_name) <= 63 && can(regex("^[a-z0-9][a-z0-9.-]*[a-z0-9]$", var.bucket_name)) && !strcontains(var.bucket_name, "..")
    error_message = "bucket_name must be 3-63 characters, lowercase letters/numbers/dots/hyphens, start and end with a letter or number, and not contain consecutive dots."
  }
}

variable "versioning_enabled" {
  description = "Whether to enable S3 object versioning."
  type        = bool
  default     = true
}

variable "tags" {
  description = "Tags applied to the bucket."
  type        = map(string)
  default     = {}
}
