resource "yandex_mdb_mysql_cluster" "ha" {
  name                = var.cluster_name
  environment         = var.environment
  network_id          = var.network_id
  version             = var.db_version
  security_group_ids  = var.security_group_ids
  deletion_protection = var.protection

  resources {
    resource_preset_id = var.preset_id
    disk_type_id       = var.disk_type_id
    disk_size          = var.disk_size
  }

  dynamic "host" {
    for_each = var.cluster_hosts
    content {
      zone             = lookup(host.value, "zone", "ru-central1-a")
      subnet_id        = lookup(host.value, "subnet_id", null)
      assign_public_ip = lookup(host.value, "assign_public_ip", null)
      priority         = lookup(host.value, "priority", null)
      backup_priority  = lookup(host.value, "backup_priority", null)
    }
  }

}
