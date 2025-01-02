module "mysql_cluster" {
  source        = "./mysql_cluster"
  cluster_name  = "example"
  network_id    = yandex_vpc_network.mynet.id
  cluster_hosts = var.HA == false ? [{ zone = "ru-central1-a", subnet_id = yandex_vpc_subnet.mysubnet-a.id, assign_public_ip = true }] : [{ zone = "ru-central1-a", subnet_id = yandex_vpc_subnet.mysubnet-a.id, assign_public_ip = true, priority = 50 }, { zone = "ru-central1-b", subnet_id = yandex_vpc_subnet.mysubnet-b.id, assign_public_ip = true, priority = 10 }]
}

module "mysql_db" {
  source     = "./mysql_db"
  cluster_id = module.mysql_cluster.id
  db_name    = "test"
  user_name  = "app"
}

resource "yandex_vpc_network" "mynet" {
  name = "mynet"
}

resource "yandex_vpc_security_group" "mysql-sg" {
  name       = "mysql-sg"
  network_id = yandex_vpc_network.mynet.id

  ingress {
    description    = "MySQL®"
    port           = 3306
    protocol       = "TCP"
    v4_cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "yandex_vpc_subnet" "mysubnet-a" {
  name           = "mysubnet-a"
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.mynet.id
  v4_cidr_blocks = ["10.5.0.0/24"]
}

resource "yandex_vpc_subnet" "mysubnet-b" {
  name           = "mysubnet-b"
  zone           = "ru-central1-b"
  network_id     = yandex_vpc_network.mynet.id
  v4_cidr_blocks = ["10.6.0.0/24"]
}
