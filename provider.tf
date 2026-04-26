terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "~> 0.73"
    }
  }
}

# Настройка подключения к Proxmox серверу
provider "proxmox" {
  endpoint = "https://192.168.64.5:8006/"
  username = "terraform@pve"
  password = var.password
  insecure = true # Отключаем проверку TLS-сертификата
}
