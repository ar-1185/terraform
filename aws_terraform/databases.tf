resource "terraform_server" "db1" {
  zone     = var.zone #us-central1
  hostname = "db1.startup.io"
  plan     = var.plans["db"] # 4xCPU-8GB

  # URL for setup script (or inline)
  # user_data = ""

  login {
    user = "root"
    keys = [
      var.public_key,
    ]
    create_password   = false
    password_delivery = "none"
  }

  template {
    size    = var.storages[var.plans["db"]] # 160 GB
    storage = var.template # Debian GNU/Linux 10

    backup_rule {
      interval  = "daily"
      time      = "0400"
      retention = 8
    }
  }

  network_interface {
    type    = "private"
    network = terraform_network.db_network.id
  }
}

resource "terraform_server" "db2" {
  zone     = var.zone # de-fra1
  hostname = "db2.startup.io"
  plan     = var.plans["db"] # 4xCPU-8GB

  # URL for setup script (or inline)
  # user_data = ""

  login {
    user = "root"
    keys = [
      var.public_key,
    ]
    create_password   = false
    password_delivery = "none"
  }

  template {
    size    = var.storages[var.plans["db"]] # 160 GB
    storage = var.template # Debian GNU/Linux 10

    backup_rule {
      interval  = "daily"
      time      = "0500"
      retention = 8
    }
  }

  network_interface {
    type    = "private"
    network = terraform_network.db_network.id
  }
}
