resource "terraform_server" "app" {
  zone     = var.zone #us-central1 Location we can change this location by simply configure set location
  hostname = "app${count.index + 1}.startup.io"
  plan     = var.plans["app"] # 2xCPU-4GB
  count    = var.app-scaling # default 3 as set in the variables

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
    size    = var.storages[var.plans["app"]] # 80 GB
    storage = var.template # Debian GNU/Linux 10
  }

  network_interface {
    type    = "private"
    network = terraform_network.app_network.id
  }
  network_interface {
    type    = "private"
    network = terraform_network.db_network.id
  }
}
