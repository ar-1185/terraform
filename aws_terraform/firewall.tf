resource "upcloud_firewall_rules" "myapp_firewall" {
  
  count      = length(upcloud_server.lb)
  depends_on = [upcloud_server.lb[0],upcloud_server.lb[1]]
  server_id  = upcloud_server.lb[count.index].id

  firewall_rule {
    action                 = "accept"
    comment                = "http"
    destination_port_start = 22
    destination_port_end   = 22
    direction              = "in"
    family                 = "IPv4"
  }
  
  firewall_rule {
    action                 = "accept"
    comment                = "http(IPv6)"
    destination_port_start = 22
    destination_port_end   = 22
    direction              = "in"
    family                 = "IPv6"
  }

  firewall_rule {
    action                 = "accept"
    comment                = "http"
    destination_port_start = 53
    destination_port_end   = 53
    direction              = "in"
    family                 = "IPv4"
  }
  
  firewall_rule {
    action                 = "accept"
    comment                = "http(IPv6)"
    destination_port_start = 53
    destination_port_end   = 53
    direction              = "in"
    family                 = "IPv6"
  }

  firewall_rule {
    action                 = "accept"
    comment                = "http"
    destination_port_start = 80
    destination_port_end   = 80
    direction              = "in"
    family                 = "IPv4"
  }
  
  firewall_rule {
    action                 = "accept"
    comment                = "http(IPv6)"
    destination_port_start = 80
    destination_port_end   = 80
    direction              = "in"
    family                 = "IPv6"
  }
  
  firewall_rule {
    action                 = "accept"
    comment                = "https"
    destination_port_start = 443
    destination_port_end   = 443
    direction              = "in"
    family                 = "IPv4"
  }
  
  firewall_rule {
    action                 = "accept"
    comment                = "https(IPv6)"
    destination_port_start = 443
    destination_port_end   = 443
    direction              = "in"
    family                 = "IPv6"
  }
  
  firewall_rule {
    action    = "drop"
    direction = "in"
    family    = "IPv6"
  }
  
  firewall_rule {
    action    = "drop"
    direction = "in"
    family    = "IPv4"
  }
}
