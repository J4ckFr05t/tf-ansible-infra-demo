terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      # optional: you can pin a broad range, or omit pin to get latest
      version = ">= 2.13.0"
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}

resource "docker_image" "nginx" {
  name = "nginx:stable"   # use stable or latest per your taste
}

resource "docker_container" "demo_nginx" {
  name  = "demo-nginx"
  image = docker_image.nginx.name   # <- changed here
  ports {
    internal = 80
    external = 8080
  }
  restart = "on-failure"
}
