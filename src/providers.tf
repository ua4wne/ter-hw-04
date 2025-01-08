terraform {
  backend "s3" {
    shared_credentials_files = [ "~/.aws/credentials" ]
    shared_config_files = [ "~/.aws/config" ]
    profile = "default"
    region = "ru-central1"

    bucket = "rai-bucket-hopy82he"
    key = "develop/terraform.tfstate"

    skip_region_validation = true
    skip_credentials_validation = true
    skip_requesting_account_id = true
    skip_s3_checksum = true

    endpoints = {
      dynamodb = "https://docapi.serverless.yandexcloud.net/ru-central1/b1gp8lr5vq4et15ermu8/etnhj2dhm1vm82hv4fa7"
      s3 = "https://storage.yandexcloud.net"
    }

    dynamodb_table = "tfstate-lock-develop"
  }
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">=1.8.4"
}

provider "yandex" {
  # token                    = "do not use!!!"
  cloud_id                 = var.cloud_id
  folder_id                = var.folder_id
  service_account_key_file = file("~/.authorized_key.json")
  zone                     = "ru-central1-a" #(Optional) 
}