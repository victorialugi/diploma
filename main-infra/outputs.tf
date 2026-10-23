output "network_id" {
  value = yandex_vpc_network.diploma.id
}

output "subnet_public_d" {
  value = yandex_vpc_subnet.public_d.id
}

output "subnet_public_e" {
  value = yandex_vpc_subnet.public_e.id
}

output "subnet_private_d" {
  value = yandex_vpc_subnet.private_d.id
}

output "subnet_private_e" {
  value = yandex_vpc_subnet.private_e.id
}

output "k8s_cluster_id" {
  value = yandex_kubernetes_cluster.diploma.id
}
