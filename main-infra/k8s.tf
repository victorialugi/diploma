resource "yandex_iam_service_account" "k8s" {
  name = "k8s-sa"
}

resource "yandex_resourcemanager_folder_iam_member" "k8s_editor" {
  folder_id = var.folder_id
  role      = "editor"
  member    = "serviceAccount:${yandex_iam_service_account.k8s.id}"
}

resource "yandex_kubernetes_cluster" "diploma" {
  name       = "diploma-k8s"
  network_id = yandex_vpc_network.diploma.id

  master {
    public_ip = true

    zonal {
      zone      = yandex_vpc_subnet.public_d.zone
      subnet_id = yandex_vpc_subnet.public_d.id
    }
  }

  service_account_id      = yandex_iam_service_account.k8s.id
  node_service_account_id = yandex_iam_service_account.k8s.id
  release_channel         = "STABLE"

  depends_on = [yandex_resourcemanager_folder_iam_member.k8s_editor]
}

resource "yandex_kubernetes_node_group" "workers" {
  cluster_id = yandex_kubernetes_cluster.diploma.id
  name       = "diploma-nodes"

  instance_template {
    platform_id = "standard-v3"

    resources {
      cores  = 2
      memory = 4
    }

    boot_disk {
      type = "network-ssd"
      size = 64
    }

    scheduling_policy {
      preemptible = true
    }

    network_interface {
      nat        = true
      subnet_ids = [
        yandex_vpc_subnet.public_e.id,
      ]
    }
  }

  scale_policy {
    fixed_scale {
      size = 1
    }
  }

  allocation_policy {
    location {
      zone = "ru-central1-e"
    }
  }
}
