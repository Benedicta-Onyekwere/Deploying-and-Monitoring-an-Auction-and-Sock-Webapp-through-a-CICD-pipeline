terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "~> 2.0"

    }
  }
}

variable "do_token" {}
#variable "pvt_key" {}

provider "digitalocean" {
  token = var.do_token
 # key = var.pvt_key
}

#resource "digitalocean_droplet" "server" {
  # ...
 # ssh_keys = [
  #  var.TF_VAR_pvt_key
 # ]
#}

