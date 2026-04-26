# Публичный SSH-ключ для доступа к виртуальной машине
variable "ssh_key" {
  default = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJ49ISSHhTma5D/pQevxEDvtHy980UcenrMiuBmPCdI3 alexle@MacBook-Air-Aleksandr.local"
}

# Пароль пользователя terraform@pve для подключения к Proxmox
variable "password" {
  sensitive = true
}
