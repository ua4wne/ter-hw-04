terraform {

  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "~>0.135.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "> 5.1"
    }

    random = {
      source  = "hashicorp/random"
      version = "> 3.5"
    }
  }
  required_version = ">=1.8.4"
}

provider "yandex" {
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
  token     = var.token
  # service_account_key_file = file("~/.authorized_key.json")
  zone = "ru-central1-a" #(Optional) 
}

provider "aws" {
  skip_region_validation      = true
  skip_credentials_validation = true
  skip_requesting_account_id  = true
  access_key                  = "mock_access_key"
  secret_key                  = "mock_secret_key"
}
