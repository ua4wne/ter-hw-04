###cloud vars

variable "ssh_public_key" {
  description = "ssh public keys for authority"
  type        = list(string)
  default     = ["~/.ssh/id_ed25519.pub"]
}

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "username" {
  description = "username"
  type        = string
  default     = "ubuntu"
}

variable "packages" {
  type    = list(string)
  default = ["vim", "nginx"]
}

# variable ip_address {
#   description = "ip address"
#   type = string
#   default = "192.168.0.1"

#   validation {
#     condition     = can(regex("^((25[0-5]|(2[0-4]|1\\d|[1-9]|)\\d)\\.?\\b){4}$", var.ip_address))
#     error_message = "The IP address is not valid. Please provide a valid IP address."
#   }
# }

# variable "ip_addresses" {
#   description = "list of ip address"
#   type = list(string)
#   default = ["192.168.0.1", "1.1.1.1", "127.0.0.1"]

#   validation {
#     condition = alltrue([
#       for a in var.ip_addresses : can(regex("^((25[0-5]|(2[0-4]|1\\d|[1-9]|)\\d)\\.?\\b){4}$", a))
#     ])
#     error_message = "All elements must be valid IPv4 addresses."
#   }
# }

# variable "login" {
#   description = "user login"
#   type = string
#   default = "user"

#   validation {
#     condition     = can(regex("^[a-z]*$", var.login))
#     error_message = "login must be lower symbols."
#   }
# }

# variable "only_one" {
#   description = "Who is better Connor or Duncan?"
#   type = object({
#     Dunkan = optional(bool)
#     Connor = optional(bool)
#   })

#   default = {
#     Dunkan = true
#     Connor = false
#   }

#   validation {
#     # condition = !alltrue(values(var.only_one))
#     condition     = element(values(var.only_one), 1) != element(values(var.only_one), 2)
#     error_message = "There can be only one MacLeod"
#   }
# }