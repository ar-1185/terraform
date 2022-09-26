resource "terraform_network" "app_network" {
  name = "Application network"
  zone = var.zone #us-central1

  ip_network {
    address = "172.20.1.0/24"
    dhcp    = true
    family  = "IPv4"
  }
}

resource "terraform_network" "db_network" {
  name = "Database network"
  zone = var.zone #us-central1

  ip_network {
    address = "172.20.2.0/24"
    dhcp    = true
    family  = "IPv4"
  }
}

resource "terraform_floating_ip_address" "lb_vip" {
  depends_on = [terraform_server.lb[0]]
  zone        = var.zone #us-central1
  mac_address = terraform_server.lb[0].network_interface[0].mac_address
}
