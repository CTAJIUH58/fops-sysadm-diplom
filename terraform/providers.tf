terraform {
  required_providers {
    yandex = {
        source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

provider "yandex" {
  folder_id = "b1g9e0n72sa8lujhtbln"
  zone = "ru-central1-b"
}

