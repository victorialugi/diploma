resource "yandex_vpc_network" "diploma" {
  name = "diploma-net"
}

resource "yandex_vpc_subnet" "public_d" {
  name           = "public-d"
  zone           = "ru-central1-d"
  network_id     = yandex_vpc_network.diploma.id
  v4_cidr_blocks = ["10.10.10.0/24"]
}

resource "yandex_vpc_subnet" "public_e" {
  name           = "public-e"
  zone           = "ru-central1-e"
  network_id     = yandex_vpc_network.diploma.id
  v4_cidr_blocks = ["10.10.20.0/24"]
}

resource "yandex_vpc_subnet" "private_d" {
  name           = "private-d"
  zone           = "ru-central1-d"
  network_id     = yandex_vpc_network.diploma.id
  v4_cidr_blocks = ["10.10.110.0/24"]
}

resource "yandex_vpc_subnet" "private_e" {
  name           = "private-e"
  zone           = "ru-central1-e"
  network_id     = yandex_vpc_network.diploma.id
  v4_cidr_blocks = ["10.10.120.0/24"]
}
