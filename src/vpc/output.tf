output "id" {
  //value = yandex_vpc_subnet.develop.id
  value = [for sub in yandex_vpc_subnet.develop : sub.id]
}

output "network_id" {
  //value = yandex_vpc_subnet.develop.network_id
  value = [for sub in yandex_vpc_subnet.develop : sub.network_id]
}
