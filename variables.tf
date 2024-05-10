variable "yandex_zone" {
  description = "Зона, в которой будет создана виртуальная машина"
  default     = "ru-central1-a"
}

variable "image_id" {
  #  yc compute image list --folder-id standard-images | grep ubuntu-22-04
  description = "ID образа операционной системы для виртуальной машины"
  default     = "fd80bm0rh4rkepi5ksdi"
}

variable "v4_cidr_blocks_default" {
  description = "блок v4 IP адресов для подсети на виртуалку"
  default     = ["10.5.0.0/24"]
}

variable "vpc_name" {
  description = "network name"
  default     = "terraform"
}
