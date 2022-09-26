resource "upcloud_server" "lb" {
  count    = 2 # Number of cloud instances to deploy
  zone     = var.zone # de-fra1
  hostname = "lb${count.index + 1}.startup.io"
  plan     = var.plans["lb"] # 1xCPU-2GB
  firewall = true
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
    size    = var.storages[var.plans["lb"]] # 50 GB
    storage = var.template # Debian GNU/Linux 10
  }

  network_interface {
    type = "public"
  }
  
  network_interface {
    type    = "private"
    network = upcloud_network.app_network.id
  }
}
