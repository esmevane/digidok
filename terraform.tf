provider "digitalocean" {
  token = "${var.digital_ocean_token}"
}

resource "digitalocean_droplet" "web" {
  image = "dokku"
  name = "web-1"
  region = "nyc2"
  size = "512mb"
}
