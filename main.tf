provider "digitalocean" {
}

terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
    }
  }
}

resource "digitalocean_ssh_key" "default" {
  name       = "terraformkey"
  public_key = file("/root/.ssh/terraformkey.pub")
}

resource "digitalocean_droplet" "web" {
  image  = "debian-10-x64"
  name   = "test"
  region = "nyc3"
  size   = "s-1vcpu-1gb"
  ssh_keys = [digitalocean_ssh_key.default.fingerprint]
}
