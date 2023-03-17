resource "digitalocean_droplet" "server1" {
  image      = "ubuntu-20-04-x64"
  name       = "server1"
  region     = "lon1"
  size       = "s-1vcpu-1gb"
  

  connection {
    type        = "ssh"
    user        = "root"
    private_key = file("var.pvt_key") #("~/.ssh/id_rsa")
    host        = self.ipv4_address
  }


}

# Define the firewall rules
resource "digitalocean_firewall" "server1" {
  name = "server1-firewall"

  inbound_rule {
    protocol         = "tcp"
    port_range       = "22"
    source_addresses = ["0.0.0.0/0"]
  }

  inbound_rule {
    protocol         = "tcp"
    port_range       = "9099"
    source_addresses = ["0.0.0.0/0"]
  }

  inbound_rule {
    protocol         = "tcp"
    port_range       = "9093"
    source_addresses = ["0.0.0.0/0"]
  }

  inbound_rule {
    protocol         = "tcp"
    port_range       = "9100"
    source_addresses = ["0.0.0.0/0"]
  }
  }

resource "digitalocean_droplet" "server2" {
  image      = "ubuntu-20-04-x64"
  name       = "server2"
  region     = "lon1"
  size       = "s-1vcpu-1gb"
  ssh_keys   = [
    

  connection {
    type        = "ssh"
    user        = "root"
    private_key = file("var.pvt_key") #("~/.ssh/id_rsa")
    host        = self.ipv4_address
  }
}

# Define the firewall rules
resource "digitalocean_firewall" "server2" {
  name = "server2-firewall"

  inbound_rule {
    protocol         = "tcp"
    port_range       = "22"
    source_addresses = ["0.0.0.0/0"]
  }

  inbound_rule {
    protocol         = "tcp"
    port_range       = "80"
    source_addresses = ["0.0.0.0/0"]
  }

  inbound_rule {
    protocol         = "tcp"
    port_range       = "443"
    source_addresses = ["0.0.0.0/0"]
  }
 inbound_rule {
    protocol         = "tcp"
    port_range       = "5432"
    source_addresses = ["0.0.0.0/0"]
  }
  inbound_rule {
    protocol         = "tcp"
    port_range       = "9100"
    source_addresses = ["0.0.0.0/0"]
  }
  
}