variable "env_name" {
  type    = string
  description = "environment name"
}

# variable "zone" {
#   type    = string
#   description = "zone"
# }

# variable "cidr" {
#   type    = string
#   description = "CIDR"
# }

variable "subnets" {
  type = list
  description = "list of zone, cidr"
}