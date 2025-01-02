variable "cluster_name" {
  type    = string
  default = null
}

variable "network_id" {
  type = string
}

variable "environment" {
  type        = string
  description = "PRESTABLE or PRESTABLE"
  default     = "PRESTABLE"
  validation {
    condition     = contains(["PRESTABLE", "PRESTABLE"], var.environment)
    error_message = "Invalid cluster environment."
  }
}

variable "db_version" {
  type        = string
  description = "version MySQL®: 5.7 or 8.0"
  default     = "5.7"
  validation {
    condition     = contains(["5.7", "8.0"], var.db_version)
    error_message = "Invalid MySQL version."
  }
}

variable "security_group_ids" {
  type    = list(string)
  default = []
}

variable "protection" {
  type    = bool
  default = false
}

variable "preset_id" {
  type    = string
  default = "s2.micro"
}

variable "disk_type_id" {
  type    = string
  default = "network-ssd"
}

variable "disk_size" {
  type    = number
  default = 20
}

variable "cluster_hosts" {
  type = list(object(
    {
      zone             = string
      subnet_id        = string
      assign_public_ip = string
      priority         = optional(number)
      backup_priority  = optional(number)
  }))
  default = []
}
