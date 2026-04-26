# Определение виртуальной машины в Proxmox
resource "proxmox_virtual_environment_vm" "terraform-vm" {
  name      = "terraform-vm" # Имя виртуальной машины
  node_name = "proxmox"      # Узел кластера Proxmox
  vm_id     = 200            # Уникальный идентификатор ВМ

  # Клонирование из шаблона (VMID 100 = web-server-01)
  clone {
    vm_id = 100
    full  = true
  }

  # Вычислительные ресурсы
  cpu {
    cores = 1 # Количество ядер процессора
  }

  memory {
    dedicated = 512 # Объём оперативной памяти в МБ
  }

  # Настройка сетевого интерфейса
  network_device {
    bridge = "vmbr0"
    model  = "virtio"
  }

  # Настройка диска
  disk {
    datastore_id = "local-lvm" # Хранилище на узле Proxmox
    size         = 32
    interface    = "scsi0"
  }

  # Cloud-init: сетевые настройки и SSH-ключ
  initialization {
    ip_config {
      ipv4 {
        address = "192.168.64.10/24"
        gateway = "192.168.64.1"
      }
    }

    user_account {
      keys = [var.ssh_key] # Публичный SSH-ключ для доступа к ВМ
    }
  }
}
