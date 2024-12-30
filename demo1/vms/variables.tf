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

variable packages {
  type    = list(string)
  default = ["vim", "nginx"]
}
