terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "~> 2.0"

    }
  }
}

#variable "do_token" {}
#variable "pvt_key" {}

provider "digitalocean" {
  token = var.do_token
 # key = var.pvt_key
}

