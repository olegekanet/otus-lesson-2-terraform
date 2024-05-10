output "instance_ip_address" {
  value = yandex_compute_instance.vm_terraform_1.network_interface[0].nat_ip_address
}
